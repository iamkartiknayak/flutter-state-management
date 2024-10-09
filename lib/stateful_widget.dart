import 'package:flutter/material.dart';

void main() => runApp(CounterApp());

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('[0] CounterApp build method is called');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StatefulWidget Counter App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // data persist even on hot-reload as it is a state object
  int counter = 0; // proper place for data management

  // constructor called once in stful widget, only during start or hot-restart
  _HomePageState() {
    debugPrint('[1] HomePage constructor is called');
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('[2] HomePage build method is called');
    // int counter = 0; // resets everytime when build is called

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Stateful Widget'),
      ),
      body: Center(
        child: Text(
          '$counter',
          style: const TextStyle(fontSize: 40.0),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => counter += 1),
        child: Icon(Icons.add),
      ),
    );
  }
}
