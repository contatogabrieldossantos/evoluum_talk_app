import 'package:flutter_modular/flutter_modular.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class FirebaseFireStoreService extends Disposable {

  // Future<User?> getUserByEmail(String email) async {
  //   if (email.trim().isNotEmpty) {
     
  //     final _querySnapshot = await FirebaseFirestore.instance
  //         .collection('users')
  //         .where('email', isEqualTo: email)
  //         .get();

  //     if (_querySnapshot.docs.isNotEmpty) {
  //       return User.fromJson(_querySnapshot.docs.first.data(), _querySnapshot.docs.first.id);
  //     } 

  //   }
  //   return null;
  // }

  // Future<bool> updateUserSignature(String email, bool signed) async {
    
  //   try {

  //     if (email.trim().isNotEmpty) {

  //       final batch = FirebaseFirestore.instance.batch();

  //       final querySnapshot = await FirebaseFirestore.instance
  //           .collection('users')
  //           .where('email', isEqualTo: email)
  //           .get();

  //       querySnapshot.docs.forEach((document) {
  //         batch.update(document.reference, {'signed': signed});
  //       });
        
  //       await batch.commit();
  //       return true;

  //     }

  //   } catch (e) {
  //     print(e);
  //   }

  //   return false;

  // }

  // Future<User?> getUserByPhone(String? phone) async {
  //   if (phone != null && phone.trim().isNotEmpty) {
     
  //     final _querySnapshot = await FirebaseFirestore.instance
  //         .collection('users')
  //         .where('phone', isEqualTo: phone)
  //         .get();

  //     if (_querySnapshot.docs.isNotEmpty) {
	//       print(_querySnapshot.docs.first.data());
  //       return User.fromJson(_querySnapshot.docs.first.data(), _querySnapshot.docs.first.id);
  //     }
  //   }
  //   return null;
  // }

  // Future<Map> getLegalData(STEP step) async {
     
  //   final _querySnapshot = await FirebaseFirestore.instance
  //       .collection(step == STEP.TERMS ? 'terms' : 'politics')
  //       .get();

  //   if (_querySnapshot.docs.isNotEmpty) {
  //     return _querySnapshot.docs.first.data();
  //   }
    
  //   return {};
  // }

  // Future<User?> getUserByCredentials(String? email, String password) async {
  //   if (email != null && email.trim().isNotEmpty) {
     
  //     final _querySnapshot = await FirebaseFirestore.instance
  //         .collection('users')
  //         .where('email', isEqualTo: email)
  //         .where('password', isEqualTo: password)
  //         .get();

  //     if (_querySnapshot.docs.isNotEmpty) {
	//       print(_querySnapshot.docs.first.data);
  //       return User.fromJson(_querySnapshot.docs.first.data(), _querySnapshot.docs.first.id);
  //     }
  //   }
  //   return null;
  // }

  @override
  void dispose() {}
}
