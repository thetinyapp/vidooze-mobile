// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthPageStore on _AuthPageStore, Store {
  late final _$eventAtom = Atom(name: '_AuthPageStore.event', context: context);

  @override
  AuthEvent get event {
    _$eventAtom.reportRead();
    return super.event;
  }

  @override
  set event(AuthEvent value) {
    _$eventAtom.reportWrite(value, super.event, () {
      super.event = value;
    });
  }

  @override
  String toString() {
    return '''
event: ${event}
    ''';
  }
}
