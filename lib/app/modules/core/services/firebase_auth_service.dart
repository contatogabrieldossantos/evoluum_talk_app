import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FirebaseAuthService extends Disposable {
  
  Future<void> sendAccessToken({
    required String phone, 
    required void Function(String, [int?]) codeSent, 
    required void Function(AuthCredential) verificationCompleted, 
    required void Function(String) codeAutoRetrievalTimeout,
    required void Function(FirebaseAuthException) verificationFailed,
    int? reSendCode,
    }) async {    

    try {    
      await FirebaseAuth.instance.verifyPhoneNumber(    
        phoneNumber: phone,  
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,    
        codeSent: codeSent, 
        timeout: const Duration(seconds: 120),    
        verificationCompleted: verificationCompleted,    
        verificationFailed: verificationFailed,
        forceResendingToken: reSendCode,    
      );

    } catch (e) {    
      print(e);    
    }  

  }  

  Future<UserCredential> createAuthEmailAndPassword(String _email, String _password) async {
    return await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _email,
      password: _password,
    );
  }

  AuthCredential getCredentialByCode(String _verificationId, String _code) {
    return PhoneAuthProvider.credential(
      verificationId: _verificationId,
      smsCode: _code,
    );
  }

  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async =>
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  
  Future<UserCredential> loginUserByCredential(AuthCredential credential) async {
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<User?> changePassword(String email, String oldPassword, String newPassword) async{

    AuthCredential credential = EmailAuthProvider.credential(email: email, password: oldPassword);
    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

    return await userCredential.user!.reauthenticateWithCredential(credential)
    .then((_) async {
      await userCredential.user!.updatePassword(newPassword);
      return userCredential.user;
    })
    .catchError((error){
      print('catchError ==> $error');
      return null;
    });

  }

  Future<User?> getCurrentUser() async => FirebaseAuth.instance.currentUser;

  Future<void> signOut() async => await FirebaseAuth.instance.signOut();

  Future<bool> checkIfHasLoggedIn() async => (FirebaseAuth.instance.currentUser != null);
  
  @override
  void dispose() {}
}
