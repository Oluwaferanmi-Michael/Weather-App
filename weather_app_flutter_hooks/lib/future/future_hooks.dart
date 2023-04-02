import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:weather_app_flutter_hooks/ext.dart';


const url = 'https://www.bing.com/ck/a?!&&p=8d750660c6787131JmltdHM9MTY4MDMwNzIwMCZpZ3VpZD0yM2U3Nzg4MC0zZmM5LTY3OWMtMzFjYi02YTU0M2U3MDY2NzAmaW5zaWQ9NTUyNg&ptn=3&hsh=3&fclid=23e77880-3fc9-679c-31cb-6a543e706670&u=a1L2ltYWdlcy9zZWFyY2g_cT1JbWFnZXMmRk9STT1JUUZSQkEmaWQ9QzEyN0VDOTQ2RDE5NTBBQTM3MjA0QzVGRDYxNzVCMkIyQTlDRUJGMQ&ntb=1';
class FutureHookWidget extends HookWidget {
  const FutureHookWidget({super.key});

  @override
  Widget build(BuildContext context) {

    final future = useMemoized(() => NetworkAssetBundle(Uri.parse(url))
      .load(url)
      .then((value) => value.buffer.asUint8List())
      .then((value) => Image.memory(value)));

    final snapShot = useFuture(future);
    return Scaffold(
      body: Column(children: [
        snapShot.data].compactMap().toList()),
    );
  }
}