import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartwristband/chat.dart';
import 'package:smartwristband/login.dart';
import 'package:smartwristband/tips.dart';
import 'mqtt/MQTTManager.dart';
import 'mqtt/state/MQTTAppState.dart';
import 'widgets/mqttView.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late List<Widget> _pages;
  late Widget _home;
  late Widget _chat;
  late Widget _help;
  int currentIndex = 1;
  late MQTTAppState currentAppState;
  late MQTTManager manager;

  @override
  void initState() {

    super.initState();

    _chat = ChatPaga();
    _home = MQTTView();
    _help = Tips();
    _pages = [_help, _home, _chat];
    
  }

  void changeTab(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final MQTTAppState appState = Provider.of<MQTTAppState>(context);
    // Keep a reference to the app state.
    currentAppState = appState;
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        currentIndex: currentIndex,
        iconSize: 30,
        unselectedItemColor: const Color.fromARGB(255, 202, 198, 198),
        selectedItemColor: Colors.deepOrange,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (index) {
          changeTab(index);
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.earListen,
                size: 20,
              ),
              label: "Tips"),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.house,
                size: 20,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.message,
                size: 20,
              ),
              label: "Chat"),
        ],
      ),
    );
  }
}
