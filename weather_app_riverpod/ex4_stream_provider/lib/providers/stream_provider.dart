import 'package:ex4_stream_provider/pages/home_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final tickerProvider = StreamProvider((ref) => Stream.periodic(const Duration(seconds: 1), (i) => i + 1));

final namesProvider = FutureProvider((ref) async {
  final count = await ref.watch(tickerProvider.future);
  return names.getRange(0, count);});
