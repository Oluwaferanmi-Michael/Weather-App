

enum LottieAnimation{
  

  dataNotFound(name: 'data_not_found'),
  error(name: 'error'),
  loading(name: 'loading'),
  empty(name: 'empty'),
  smallError(name: 'smallError');
  
  final String name;
  const LottieAnimation({required this.name});
}