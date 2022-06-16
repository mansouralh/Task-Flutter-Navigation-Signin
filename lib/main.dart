import 'package:flutter/material.dart';
import 'package:sign_in/pages/home_screen.dart';
import 'package:sign_in/pages/signed_in.dart';
import 'package:go_router/go_router.dart';

// Step 2

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Step 4
    return MaterialApp.router(
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate);
  }

  // final _router = GoRoute(initallocation: "/");

  final _router = GoRouter(routes: [
    GoRoute(path: "/", builder: (context, state) => HomeScreen()),
    GoRoute(
        path: "/signin",
        builder: (context, state) => SignedIn(username: state.extra as String)),
  ]);
  // Step 3
}
