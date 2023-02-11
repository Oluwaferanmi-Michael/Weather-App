
class Api{
  String? date = DateTime.now().toIso8601String();

  Future<String> getDate(){
    return Future.delayed(const Duration(seconds: 1),
    () => DateTime.now().toIso8601String(),).then((value) {
      date = value;
      return value;
    });
  }

  void call() {
    print('this is a method call');
  }
}
