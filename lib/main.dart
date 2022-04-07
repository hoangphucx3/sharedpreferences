import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PrefCounter(),
    );
  }
}

class PrefCounter extends StatefulWidget {
  const PrefCounter({Key? key}) : super(key: key);

  @override
  State<PrefCounter> createState() => _PrefCounterState();
}

class _PrefCounterState extends State<PrefCounter> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _getPrefs();
  }

  void _getPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = prefs.getInt('counter1') ?? 0;
    });
  }

  void _incrementCount() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter1') ?? 0) + 1;
      prefs.setInt('counter1', _counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared Preferences'),
      ),
      body: Center(
        child: Text('So lan bam nut la: $_counter',
        style: const TextStyle(fontSize: 30),),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: _incrementCount,
      ),
    );
  }
}
