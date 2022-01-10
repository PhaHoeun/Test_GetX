import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(const GetMaterialApp(home: Home()));

class Controller extends GetxController {
  var count = 0.obs;
  increment() => count++;
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Controller c = Get.put(Controller());

    return Scaffold(
      appBar: AppBar(title: Obx(() => Text('Click: ${c.count}'))),
      body: Center(
        child: ElevatedButton(
          child: const Text("Go to other"),
          onPressed: () => Get.to(Other()),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add), onPressed: c.increment),
    );
  }
}

class Other extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final Controller c = Get.find();

  Other({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    // Access the updated count variable
    return Scaffold(body: Center(child: Text("${c.count}")));
  }
}
