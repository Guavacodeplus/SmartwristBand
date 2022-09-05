import 'package:flutter/material.dart';
import 'package:smartwristband/landing.dart';
import 'package:smartwristband/mqtt/state/MQTTAppState.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Wristband',
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider<MQTTAppState>(
        create: (_) => MQTTAppState(),
        builder: (context, child) {
          return const LandingPage();
        },
      ),
    );
  }
}
