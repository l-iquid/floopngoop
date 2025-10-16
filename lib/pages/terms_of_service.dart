
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TermsOfServicePage extends StatefulWidget {
  const TermsOfServicePage({super.key});

  @override
  State<StatefulWidget> createState() => _TermsOfServicePageState();
}


class _TermsOfServicePageState extends State<TermsOfServicePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(padding: const EdgeInsets.all(12.0)),
            Text("Diddy blud ahh terms of service ☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️"),

            BackButton(onPressed: () {
              context.go('/');
            }),
          ],
        )
      )
    );
  }
}