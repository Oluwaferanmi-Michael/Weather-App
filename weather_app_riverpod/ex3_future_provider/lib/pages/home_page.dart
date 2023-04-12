import 'package:ex3_future_provider/enums.dart';
import 'package:ex3_future_provider/providers/future_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentWeather = ref.watch(weatherProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
      ),

      body: Column(
        children: [
          currentWeather.when(
            data: (data) => Text(data, style: const TextStyle(fontSize: 32),),
            error: (_, __) => const Text('error',  style: TextStyle(fontSize: 32),),
            loading: () => const CircularProgressIndicator.adaptive()),
          Expanded(
            child: ListView.builder(
              itemCount: City.values.length,
              itemBuilder: (context, index) {
                final city = City.values[index];
                final isSelected = city == ref.watch(currentCityProvider);
                return ListTile(
                  title: Text(city.toString()),
                  trailing: isSelected ? const Icon(Icons.check) : null, 
                  onTap: () => ref.read(currentCityProvider.notifier).state = city,
                );
              }))
        ],
      ),
    );
    }
}