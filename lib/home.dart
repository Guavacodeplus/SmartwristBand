import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'mqtt/MQTTManager.dart';
import 'mqtt/state/MQTTAppState.dart';
// import 'package:syncfusion_flutter_gauges/gauges.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late MQTTAppState currentAppState;
  late MQTTManager manager;

  @override
  Widget build(BuildContext context) {
    final MQTTAppState appState = Provider.of<MQTTAppState>(context);
    // Keep a reference to the app state.
    currentAppState = appState;

    // currentAppState.
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.network(
              "https://media.self.com/photos/617811dba28304b5a601fc8c/4:3/w_2560%2Cc_limit/GettyImages-1265249194.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red, width: 2),
              ),
              child: const Text("Inhaler not connected"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: 200,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      image: const DecorationImage(
                        image: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXVWiEPKRYb5FhMLbxnkG6KgEQvLKkQ8uqSA&usqp=CAU"),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        const Text("Temperature"),
                        Expanded(child: Container()),
                        const Text("30C")
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: 200,
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
                        const Text("Air Quality"),
                        Expanded(child: Container()),
                        const Text("30%")
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
                  height: 200,
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
                        const Text("Humidity"),
                        Expanded(child: Container()),
                        const Text("30%")
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: 200,
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
                        const Text("Blood Pressure"),
                        Expanded(child: Container()),
                        const Text("60 BPM")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}





// NestedScrollView(
//         headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//           return <Widget>[
//             SliverAppBar(
//               backgroundColor: Colors.red[300],
//               expandedHeight: 230.0,
//               floating: false,
//               pinned: true,
//               flexibleSpace: FlexibleSpaceBar(
//                 // centerTitle: true,
//                 title: const Text("lelee Asụma",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 20.0,
//                     )),
//                 background: Image.network(
//                   "",
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ];
//         },
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
             
// // ################################################
//             ],
//           ),
//         ),
//       ),


// Column(children: [
//           Hero(
//             tag: 'hero',
//             child: Container(
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(48.0),
//                   boxShadow: [
//                     BoxShadow(
//                         color: Color.fromARGB(179, 80, 197, 65),
//                         blurRadius: 20.0)
//                   ]),
//               child: CircleAvatar(
//                   backgroundColor: Colors.white,
//                   radius: 48.0,
//                   child: Text("50")),
//             ),
//           ),
//         ])