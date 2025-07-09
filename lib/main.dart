import 'package:flutter/material.dart';

import 'util/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.initScreen(),
      onGenerateRoute: Routes.generateRoute,
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
    );
  }
}
