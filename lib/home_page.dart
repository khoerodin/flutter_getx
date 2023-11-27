import 'package:flutter/material.dart';
import 'package:flutter_getx/counter_app.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CounterApp(),
                ),
              );
            },
            child: const Text('Counter App'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Counter App SetState'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Realtime Input App'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Simple CRUD App'),
          ),
        ],
      ),
    );
  }
}
