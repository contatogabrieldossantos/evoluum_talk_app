// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppController on _AppControllerBase, Store {
  final _$userAtom = Atom(name: '_AppControllerBase.user');

  @override
  User? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$determineAuthStatusAsyncAction =
      AsyncAction('_AppControllerBase.determineAuthStatus');

  @override
  Future determineAuthStatus() {
    return _$determineAuthStatusAsyncAction
        .run(() => super.determineAuthStatus());
  }

  @override
  String toString() {
    return '''
user: ${user}
    ''';
  }
}
