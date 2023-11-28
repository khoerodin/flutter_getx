// ignore_for_file: avoid_print

import 'package:d_input/d_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RealtimeInputApp extends StatefulWidget {
  const RealtimeInputApp({super.key});

  @override
  State<RealtimeInputApp> createState() => _RealtimeInputAppState();
}

class _RealtimeInputAppState extends State<RealtimeInputApp> {
  final realtimeInputController = Get.put(RealtimeInputController());

  @override
  void initState() {
    print('initState()');
    super.initState();
  }

  @override
  void dispose() {
    realtimeInputController.clearInput();
    print('dispose()');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build()');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Realtime Input'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          DInput(
            controller: TextEditingController(),
            fillColor: Theme.of(context).primaryColor.withOpacity(.1),
            radius: BorderRadius.circular(30),
            onChanged: (value) {
              realtimeInputController.input = value!;
              // print(value);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Obx(() {
            return Text(
              realtimeInputController.input,
              style: Theme.of(context).textTheme.displaySmall,
            );
          }),
        ],
      ),
    );
  }
}

class RealtimeInputController extends GetxController {
  final _input = ''.obs;
  String get input => _input.value;
  set input(String n) => _input.value = n;

  clearInput() {
    Get.delete<RealtimeInputController>(force: true);
  }
}
