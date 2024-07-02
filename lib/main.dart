import 'package:flutter/material.dart';
import 'package:webspark_test_task/screens/calculation_screen.dart';
import 'package:webspark_test_task/screens/home_screen.dart';
import 'package:webspark_test_task/screens/solutions_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const HomeScreen(),
        'calculation': (context) => const CalculationScreen(),
        'solutions': (context) => const SolutionListScreen(),
        'solution': (context) => const MyHomePage(title: 'Solution'),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times: Calculating...',
            ),
            Text(
              '1',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/calculation'),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
