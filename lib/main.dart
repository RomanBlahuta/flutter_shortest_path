import 'package:flutter/material.dart';
import 'package:webspark_test_task/blocs/app_bloc/app_bloc.dart';
import 'package:webspark_test_task/screens/calculation_screen.dart';
import 'package:webspark_test_task/screens/home_screen.dart';
import 'package:webspark_test_task/screens/solution_view_screen.dart';
import 'package:webspark_test_task/screens/solutions_list_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AppBloc(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
            useMaterial3: true,
          ),
          routes: {
            '/': (context) => const LoaderOverlay(child: HomeScreen()),
            'calculation': (context) => const LoaderOverlay(child: CalculationScreen()),
            'solutions': (context) => const SolutionListScreen(),
            'solution': (context) => const SolutionViewScreen(),
          },
        ),
    );
  }
}
