
class Api{
  String? date;

  Future<String> getDate(){
    return Future.delayed(const Duration(seconds: 1),
    () => DateTime.now().toIso8601String(),).then((value) {
      date = value;
      return value;
    });
  }
}
