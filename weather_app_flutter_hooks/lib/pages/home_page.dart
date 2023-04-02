import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';


Stream<String> getTime() => Stream.periodic(
 const Duration(seconds: 1) ,
 (_) => DateTime.now().toIso8601String()
);


class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    final text = useState('initialData');
    useEffect(() {
      controller.addListener(() {
        text.value = controller.text;
      });
      return null;}, [controller]);
    // final dateTime = useStream(getTime());

    return Scaffold(
      appBar: AppBar(
        title: Text('${text.value}'),
      ),

      body: Column(children: [
        TextField(
          controller: controller,
        )
      ]),
    );
  }
}