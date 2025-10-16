import 'package:flutter/material.dart';
import 'package:flutter_training_template/app.dart';
import 'package:flutter_training_template/core_state.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CoreState(),
      child: const MyApp()
    )
  );
}
