abstract class AppExceptions implements Exception{
  final String message;
  final StackTrace? stackTrace;

  AppExceptions({required this.message, required this.stackTrace});
}