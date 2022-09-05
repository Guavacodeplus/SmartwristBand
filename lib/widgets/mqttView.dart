import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartwristband/mqtt/state/MQTTAppState.dart';
import 'package:smartwristband/mqtt/MQTTManager.dart';
import 'package:smartwristband/utilities/appText.dart';
import 'package:smartwristband/utilities/variables.dart';
import '../utilities/sharedprefernce.dart';

class MQTTView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MQTTViewState();
  }
}

final TextEditingController _number = TextEditingController();

class _MQTTViewState extends State<MQTTView> {
  late MQTTAppState currentAppState;
  final TextEditingController _serial = TextEditingController();

  final TextEditingController _name = TextEditingController();
  late MQTTManager manager;
  int count = 3;
  String? _user = "";

  List? mqttData = [0, 0, 0, 0, 'Disconnected', 'Ok'];

  _logout() {
    _disconnect();
    removedata("name");
    setState(() {
      count = 3;
      uname = "";
    });
  }

  @override
  void initState() {
    super.initState();
    loaddata();
    setState(() {
      _user = username;
    });
    // print(_user);
  }

  @override
  Widget build(BuildContext context) {
    final MQTTAppState appState = Provider.of<MQTTAppState>(context);

    // Keep a reference to the app state.
    currentAppState = appState;

    if (currentAppState.getReceivedText.isNotEmpty) {
      if (currentAppState.getReceivedText == "Connected!") {
      } else {
        mqttData = currentAppState.getReceivedText.split(",");
      }
    }

    if (count == 0) {
      configureAndConnect(serial);
      count = 1;
    }
    // print(mqttData);

    // final Scaffold scaffold = Scaffold(body: _buildColumn());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: smallText("lelee Asụma", color: Colors.white),
        toolbarHeight: 40,
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.more_vert_outlined)),
        actions: [
          IconButton(
            onPressed: () => uname == "" ? null : bottomsheet(),
            icon: const Icon(
              Icons.health_and_safety_outlined,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () => uname == "" ? null : _logout(),
            icon: const Icon(
              Icons.cancel_outlined,
              color: Colors.white,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: mqttData![5] == "Ok"
                  ? const Icon(Icons.gpp_good_outlined)
                  : const Icon(Icons.gpp_bad_outlined))
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 260,
            width: double.infinity,
            child: Image.network(
              "https://media.self.com/photos/617811dba28304b5a601fc8c/4:3/w_2560%2Cc_limit/GettyImages-1265249194.jpg",
              fit: BoxFit.cover,
            ),
          ),
          uname == "" ? _login() : _buildColumn(),
        ],
      )),
    );
  }

  // #############################################################

  Widget _buildColumn() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red, width: 2),
            ),
            child: mqttData![4] == "Conn"
                ? smallText("Inhaler Connected")
                : smallText("Inhaler not Connected"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.45,
                height: 180,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    image: const DecorationImage(
                        image: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXVWiEPKRYb5FhMLbxnkG6KgEQvLKkQ8uqSA&usqp=CAU"))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      payText("Temperature"),
                      Expanded(child: Container()),
                      balance("${mqttData![0]}°C")
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.45,
                height: 180,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    image: const DecorationImage(
                        image: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKrAsYk_wLKwUXEndbkq3w52DR6-OzaulLrQ&usqp=CAU"))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      payText("Air Quality"),
                      Expanded(child: Container()),
                      balance(
                        "${mqttData![2]}%",
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.45,
                height: 180,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    image: const DecorationImage(
                        image: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrfMLukKIIGq8esuEcEorIDEbJW1ezQMqR4g&usqp=CAU"))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      payText("Humidity"),
                      Expanded(child: Container()),
                      balance("${mqttData![1]}%")
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.45,
                height: 180,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    image: const DecorationImage(
                        image: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZL_oTNpRf8xzUiXMC8wAsGWXOec-aIqTIRg&usqp=CAU"))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      payText("Blood Pressure"),
                      Expanded(child: Container()),
                      balance("${mqttData![3]}Bpm")
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  // Utility functions
  String _prepareStateMessageFrom(MQTTAppConnectionState state) {
    switch (state) {
      case MQTTAppConnectionState.connected:
        return 'Connected';
      case MQTTAppConnectionState.connecting:
        return 'Connecting';
      case MQTTAppConnectionState.disconnected:
        return 'Disconnected';
    }
  }

  void configureAndConnect(String topik) {
    // ignore: flutter_style_todos
    String osPrefix = 'Flutter_iOS';
    if (Platform.isAndroid) {
      osPrefix = 'Flutter_Android';
    }
    manager =
        MQTTManager(topic: topik, identifier: osPrefix, state: currentAppState);
    manager.initializeMQTTClient();
    manager.connect();
  }

  void _disconnect() {
    manager.disconnect();
  }

  Widget _login() {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          // Image.network(
          //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxhIIvwuvQK8-L-o6m9aKSv5VTCc7BDjbS8w&usqp=CAU"),
          SizedBox(height: 30),
          inputFeild("Hardware Serial", "", _serial),
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
                  count = 0;

                  savedata(uname);
                });
              },
              child: title("Connect", color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  bottomsheet() {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(30),
            child: Column(children: [
              inputFeild("Enter Number", "", _number),
              SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                height: 50,
                child: MaterialButton(
                  color: Colors.red,
                  onPressed: () {
                    _number.clear();
                    Navigator.pop(context);
                  },
                  child: title("Save", color: Colors.white),
                ),
              )
            ]),
          );
        });
  }
}
