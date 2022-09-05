import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smartwristband/models/getpost.dart';
import 'package:smartwristband/utilities/sharedprefernce.dart';
import 'package:smartwristband/utilities/variables.dart';
import 'utilities/appText.dart';

class ChatPaga extends StatefulWidget {
  ChatPaga({Key? key}) : super(key: key);

  @override
  State<ChatPaga> createState() => _ChatPagaState();
}

class _ChatPagaState extends State<ChatPaga> {
  final _message = TextEditingController();
  var _text;
  String? _user = "";

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      loaddata();
      // print(username);
      setState(() {
        _user = username;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: smallText(
              "Meet a Doctor",
              color: Colors.white,
            ),
            toolbarHeight: 40,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
              child: _user == ""
                  ? Center(
                      child: title("connect to Hardware to Meet a doctor"),
                    )
                  : Column(
                      children: [
                        Expanded(
                          child: StreamBuilder<ChatClass>(
                            stream: streamchat(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                // print(username);
                                return ListView.builder(
                                  // controller: _scrollController,
                                  itemCount: snapshot.data!.data.length,
                                  itemBuilder: (contect, i) {
                                    var content = snapshot.data!.data;
                                    // print(myWalletId);
                                    if (content[i].hardwareId == _user) {
                                      // print(content[i].hardwareId);
                                      return Container(
                                        color: const Color.fromARGB(
                                                255, 248, 213, 207)
                                            .withOpacity(0.5),
                                        margin: const EdgeInsets.only(
                                            top: 10, left: 25),
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                smallText(content[i].hardwareId,
                                                    color: Colors.black54),
                                              ],
                                            ),
                                            const Divider(),
                                            title(content[i].message),
                                            const SizedBox(height: 10),
                                            text(
                                              content[i].date,
                                              color: const Color.fromARGB(
                                                  255, 133, 133, 133),
                                            )
                                          ],
                                        ),
                                      );
                                    } else {
                                      // print(content[i].hardwareId);
                                      return Container(
                                        color:
                                            Color.fromARGB(255, 243, 160, 160)
                                                .withOpacity(0.5),
                                        margin: const EdgeInsets.only(
                                            top: 10, right: 25),
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(child: Container()),
                                                smallText(content[i].hardwareId,
                                                    color: Colors.black54)
                                              ],
                                            ),
                                            const Divider(),
                                            title(content[i].message),
                                            const SizedBox(height: 10),
                                            text(
                                              content[i].date,
                                              color: const Color.fromARGB(
                                                  255, 133, 133, 133),
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                  },
                                );
                              } else if (snapshot.hasError) {
                                return text("error");
                              } else {
                                return text("Loading...");
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: inputFeild("Enter Message", "", _message,
                                  lineheight: 1),
                            ),
                            IconButton(
                              onPressed: () async {
                                if (_message.text.isEmpty) {
                                  return;
                                }
                                setState(() {
                                  _text = _message.text;
                                });
                                _message.clear();
                                await sendpost(
                                    _text, DateTime.now().toString(), _user);
                              },
                              icon: const Icon(
                                Icons.send,
                                color: Colors.red,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
            ),
          ),
        ),
        onWillPop: () async {
          setState(() {
            // currentIndex = 0;
          });
          return false;
        });
  }
}
