import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

final getIt = GetIt.instance; // for using singleton and access from anywhere

void main() {
  // preserve the state
  getIt.registerLazySingleton(
    () => Counter(),
    dispose: (counter) => counter.dispose(),
  );

  // resets the counter on hot-reload
  // getIt.registerFactory(() => Counter());

  runApp(const CounterApp());
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('[0] CounterApp build method is called');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RxDart(StreamBuilder) Counter App',
      home: HomePage(),
    );
  }
}

class Counter {
  Counter() {
    debugPrint('[1] Counter contructor called ');
  }

  final counterSubject = BehaviorSubject<int>.seeded(0);

  Stream<int> get counterStream => counterSubject.stream;

  Sink<int> get _counterSink => counterSubject.sink;

  void increment() => _counterSink.add(counterSubject.value + 1);

  void dispose() => counterSubject.close();
}

class HomePage extends StatelessWidget {
  HomePage({super.key}) {
    debugPrint('[2] HomePage constructor called ');
  }

  final counter = getIt<Counter>();

  @override
  Widget build(BuildContext context) {
    debugPrint('[3] HomePage build method is called');

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('RxDart Counter App'),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: counter.counterStream,
          builder: (context, snapshot) {
            debugPrint('[4] builder method is called');
            final counterValue = snapshot.data ?? 0;
            return Text(
              '$counterValue',
              style: const TextStyle(fontSize: 40),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counter.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
