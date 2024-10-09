import 'package:flutter/material.dart';

void main() => runApp(const CounterApp());

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('[0] CounterApp build method is called');
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StatefulWidget Lifecycle',
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
  // Constructor called once when the State object is created
  _HomePageState() {
    debugPrint('[1] HomePage constructor is called');
  }

  @override
  void activate() {
    super.activate();
    debugPrint('activate called');
  }

  @override
  void deactivate() {
    super.deactivate();
    debugPrint('deactivate called');
  }

  @override
  void initState() {
    super.initState();
    debugPrint('[2] initState method is called');
    // Initialize state or perform setup here
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint('[3] didChangeDependencies method is called');
    // Called when dependencies change
  }

  @override
  void reassemble() {
    super.reassemble();
    debugPrint('reassemble method is called');
    // Called during hot reload
  }

  @override
  void didUpdateWidget(covariant HomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint('[6] didUpdateWidget method is called');
    // Called when the widget configuration changes
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    debugPrint('setState method is called');
    // Called when you want to update the state
  }

  @override
  void dispose() {
    debugPrint('[8] dispose method is called');
    // Cleanup resources here
    super.dispose();
  }

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    debugPrint('[4] HomePage build method is called');
    // Build the widget's UI here
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Stateful Widget Lifecycle'),
      ),
      body: Center(
        child: Text(
          '$counter',
          style: const TextStyle(fontSize: 40),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => counter += 1),
        child: const Icon(Icons.add),
      ),
    );
  }
}
