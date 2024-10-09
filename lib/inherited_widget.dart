import 'package:flutter/material.dart';

void main() => runApp(const CounterApp());

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('[0] CounterApp build method is called');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'InheritedWidget Counter App',
      home: InheritedCounter(child: HomePage()),
    );
  }
}

class InheritedCounter extends InheritedWidget {
  InheritedCounter({
    super.key,
    required super.child,
  }) {
    debugPrint('[3] InheritedCounter constructor is called');
  }

  // CounterState constructor called before InheritedCounter constructor
  final state = CounterState();

  static InheritedCounter of(BuildContext context) {
    final InheritedCounter? result =
        context.dependOnInheritedWidgetOfExactType<InheritedCounter>();
    assert(result != null, 'No InheritedCounter found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant InheritedCounter oldWidget) =>
      state != oldWidget.state;
}

class CounterState extends ChangeNotifier {
  CounterState() {
    debugPrint('[2] CounterState constructor is called');
  }
  int _counter = 0;
  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key}) {
    debugPrint('[1] HomePage constructor is called');
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('[4] HomePage build method is called');
    final state = InheritedCounter.of(context).state;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Inherited Widget'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: state,
          builder: (context, child) {
            debugPrint('[5] builder method is called');
            final counter = state.counter;

            return Text(
              '$counter',
              style: const TextStyle(fontSize: 40),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: state.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}


// Note:
// If class A is initialized (constructor is called) inside class B, class A constructor will 
// be called before class B constructor