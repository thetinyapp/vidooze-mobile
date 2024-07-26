import 'package:firebase_core/firebase_core.dart';

abstract class AppDataSource {
  Future init();
}

class FirebaseAppDataSource implements AppDataSource {
  @override
  Future init() => Firebase.initializeApp();
}
