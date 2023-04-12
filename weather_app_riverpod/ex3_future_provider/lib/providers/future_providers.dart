import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ex3_future_provider/enums.dart';

Future<WeatherEmoji> getWeather(City city){
  return Future.delayed(const Duration(seconds: 1), 
  () => {
    City.nigeria: '❤️',
    City.norway: '😁',
    City.shanghai: '😘',
    City.tokyo: '😊'
  }[city] ?? '💕');
}


//  UI Writes to this 
final currentCityProvider = StateProvider<City?>((ref) => null);

//  UI Reads this
final weatherProvider = FutureProvider<WeatherEmoji>((ref) async {
  final city = ref.watch(currentCityProvider);
  if (city != null) {
    return getWeather(city);
  } else {
    return '😒';
  }
});