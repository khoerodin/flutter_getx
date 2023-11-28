// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class CounterAppSetState extends StatefulWidget {
  const CounterAppSetState({super.key});

  @override
  State<CounterAppSetState> createState() => _CounterAppSetStateState();
}

class _CounterAppSetStateState extends State<CounterAppSetState> {
  int counter = 1;

  @override
  void initState() {
    print('initState()');
    super.initState();
  }

  @override
  void dispose() {
    print('dispose()');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build()');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App SetState'),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton.filled(
              onPressed: () {
                counter -= 1;
                setState(() {});
              },
              icon: const Icon(
                Icons.remove,
              ),
            ),
            const SizedBox(width: 20),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(width: 20),
            IconButton.filled(
              onPressed: () {
                counter += 1;
                setState(() {});
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
