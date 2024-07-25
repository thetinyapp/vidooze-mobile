abstract class ErrorReportingDataSource {
  Future reportError();
}

class FirebaseErrorReportingDataSource implements ErrorReportingDataSource {
  @override
  Future reportError() {
    return Future.value("Yet to be implemented");
  }
}
