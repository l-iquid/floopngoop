import 'package:flutter/material.dart';
import 'package:flutter_training_template/pages/bank_page.dart';
import 'package:flutter_training_template/pages/create_account.dart';
import 'package:flutter_training_template/pages/terms_of_service.dart';
import 'package:go_router/go_router.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.from(colorScheme: ColorScheme.dark(
        primary: Colors.blue,
        outline: Colors.blueAccent,
        surface: Color.fromRGBO(0, 10, 20, 1)
      )),
      routerConfig: GoRouter(
        initialLocation: '/',
        routes: [
          GoRoute(
            path: '/',
            name: 'home',
            builder: (context, state) => const CreateAccountPage(),
          ),
          GoRoute(
            path: '/bank',
            name: 'bank',
            builder: (context, state) => const BankPage(),
          ),
          GoRoute(
            path: '/tos',
            name: 'tos',
            builder: (context, state) => const TermsOfServicePage(),
          ),
          
        ]
      ),
      title: "h",
    );
  }
  
}