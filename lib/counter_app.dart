// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    print('build()');
    final counter = 1.obs;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton.filled(
              onPressed: () {
                counter.value -= 1;
                print(counter);
              },
              icon: const Icon(
                Icons.remove,
              ),
            ),
            const SizedBox(width: 20),
            Obx(() {
              return Text(
                '${counter.value}',
                style: Theme.of(context).textTheme.displaySmall,
              );
            }),
            const SizedBox(width: 20),
            IconButton.filled(
              onPressed: () {
                counter.value += 1;
                print(counter);
              },
              icon: const Icon(
                Icons.add,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
