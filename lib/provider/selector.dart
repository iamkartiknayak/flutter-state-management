import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const CounterApp());

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('[0] CounterApp build method is called');
    return MaterialApp(
      title: 'Provider Selector Counter App',
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => CounterProvider(),
        child: HomePage(),
      ),
    );
  }
}

class CounterProvider extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  void increment() {
    _counter += 1;
    notifyListeners();
  }

  void triggerNotifyListeners() {
    notifyListeners();
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key}) {
    debugPrint('[1] HomePage constructor is called');
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('[2] HomePage build method is called');
    final counterProvider = context.read<CounterProvider>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Provider Selector '),
      ),
      body: Center(
        // using Selector (Most efficient)
        // only enclosed part of tree will rebuild when select var change state
        child: Selector<CounterProvider, int>(
          selector: (context, provider) => provider.counter,
          builder: (context, counter, child) {
            debugPrint('[3] builder method is called');

            return Text(
              '$counter',
              style: const TextStyle(fontSize: 40),
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: counterProvider.increment,
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 20.0),
          FloatingActionButton(
            onPressed: counterProvider.triggerNotifyListeners,
            child: const Icon(Icons.table_restaurant_rounded),
          ),
        ],
      ),
    );
  }
}
