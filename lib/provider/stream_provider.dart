import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const CounterApp());

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('[0] CounterApp build method is called');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Streamprovider Counter App',
      home: MultiProvider(
        providers: [
          StreamProvider<int>(
            create: (_) => CounterStream().stream,
            initialData: 0,
            lazy: true,
          ),
          StreamProvider<int>(
            create: (_) => AnotherStream().stream,
            initialData: 5,
            lazy: true,
          ),
          StreamProvider(
            create: (_) => TimeStream().stream,
            initialData: 'Date',
          )
        ],
        child: HomePage(),
      ),
    );
  }
}

class CounterStream {
  final _controller = StreamController<int>();
  int _counter = 0;

  CounterStream() {
    Timer.periodic(const Duration(seconds: 2), (timer) {
      _controller.sink.add(_counter++);
    });
  }

  Stream<int> get stream => _controller.stream;

  void dispose() => _controller.close();
}

class AnotherStream {
  final _controller = StreamController<int>();
  int _counter = 0;

  AnotherStream() {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      _controller.sink.add(_counter += 10);
    });
  }

  Stream<int> get stream => _controller.stream;

  void dispose() => _controller.close();
}

class TimeStream {
  final _controller = StreamController<String>();

  TimeStream() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      _controller.sink.add('${DateTime.now().second}');
    });
  }

  Stream<String> get stream => _controller.stream;

  void dispose() => _controller.close();
}

class HomePage extends StatelessWidget {
  HomePage({super.key}) {
    debugPrint('[1] HomePage constructor is called');
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('[2] HomePage build method is called');

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('StreamProvider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<int>(
              builder: (context, counter, _) {
                debugPrint('[3] builder method is called');
                return Text(
                  '$counter',
                  style: const TextStyle(fontSize: 40.0),
                );
              },
            ),
            const SizedBox(height: 20),
            Consumer<int>(
              builder: (context, anotherCounter, _) {
                debugPrint('[3] builder method is called');
                return Text(
                  '$anotherCounter',
                  style: const TextStyle(fontSize: 40.0),
                );
              },
            ),
            const SizedBox(height: 20),
            Consumer<String>(
              builder: (context, time, _) {
                return Text(
                  time,
                  style: const TextStyle(fontSize: 30.0),
                  textAlign: TextAlign.center,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
