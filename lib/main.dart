import 'package:flutter/material.dart';

import 'features/random_cat/presentation/screens/random_cat_screen.dart';
import 'injection_container.dart' as dependency_injector;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  dependency_injector.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Cat',
      theme: ThemeData(
        primaryColor: Colors.indigo,
        accentColor: Colors.indigoAccent,
      ),
      home: RandomCatScreen(),
    );
  }
}
