

enum LottieAnimation{
  dataNotFound(name: 'data_not_found'),
  error(name: 'error'),
  loading(name: 'loading'),
  empty(name: 'empty'),
  smallError(name: 'small_error');
  
  final String name;
  const LottieAnimation({required this.name});
}