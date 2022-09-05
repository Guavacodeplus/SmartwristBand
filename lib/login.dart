import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartwristband/landing.dart';
import 'package:smartwristband/utilities/appText.dart';
import 'package:smartwristband/utilities/color.dart';
import 'package:smartwristband/utilities/variables.dart';

import 'mqtt/MQTTManager.dart';
import 'mqtt/state/MQTTAppState.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _serial = TextEditingController();
  final TextEditingController _name = TextEditingController();
  late MQTTAppState currentAppState;
  late MQTTManager manager;

  @override
  Widget build(BuildContext context) {
    final MQTTAppState appState = Provider.of<MQTTAppState>(context);
    // Keep a reference to the app state.
    currentAppState = appState;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxhIIvwuvQK8-L-o6m9aKSv5VTCc7BDjbS8w&usqp=CAU"),
              SizedBox(height: 30),
              inputFeild("Watch Serial", "", _serial),
              const SizedBox(height: 20),
              inputFeild("User's Name", "", _name),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: MaterialButton(
                  color: Colors.red,
                  onPressed: () {
                    setState(() {
                      uname = _name.text;
                      serial = _serial.text;

                      Navigator.of(context).pop();
                    });
                  },
                  child: title("Connect", color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
