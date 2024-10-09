import 'package:flutter/material.dart';

void main() => runApp(const CounterApp());

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('[0] CounterApp build method is called');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StatefulBuilder Counter App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key}) {
    debugPrint(
        '[1] HomePage constructor is called'); // called on start & hot-reload
  }
  // data wont persis on hot-reload as it is not a state object
  // int counter = 0; // Cannot be mutable in a StatelessWidget as it's immutable.

  @override
  Widget build(BuildContext context) {
    debugPrint('[2] HomePage build method is called');
    // wont persis on hot-reload
    int counter = 0; // proper place for data management

    return StatefulBuilder(
      builder: (context, setState) {
        debugPrint('[3] builder method is called');
        // int counter = 0; // resets everytime when builder is called

        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Stateful Builder'),
          ),
          body: Center(
            child: Text(
              '$counter',
              style: const TextStyle(fontSize: 40.0),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => setState(() => counter += 1),
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
