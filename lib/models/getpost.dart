import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

class ChatClass {
  ChatClass({
    required this.error,
    required this.errmsg,
    required this.data,
  });

  final bool error;
  final String errmsg;
  final List<Datum> data;

  factory ChatClass.fromRawJson(String str) =>
      ChatClass.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ChatClass.fromJson(Map<String, dynamic> json) => ChatClass(
        error: json["error"],
        errmsg: json["errmsg"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "errmsg": errmsg,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.hardwareId,
    required this.message,
    required this.date,
  });

  final String id;
  final String hardwareId;
  final String message;
  final String date;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["Id"],
        hardwareId: json["HardwareId"],
        message: json["Message"],
        date: json["Date"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "HardwareId": hardwareId,
        "Message": message,
        "Date": date,
      };
}

Stream<ChatClass> streamchat() =>
    Stream.periodic(const Duration(microseconds: 1))
        .asyncMap((event) => getpost());

Future<ChatClass> getpost() async {
  try {
    var meetList = await get(
      Uri.parse("https://codepay.guavacodeplus.tech/asumaget.php"),
    );

    // print(meetList.body);

    if (meetList.statusCode == 200) {
      var meet = ChatClass.fromJson(json.decode(meetList.body));

      return meet;
    } else {
      throw Exception();
    }
  } on SocketException {
    rethrow;
  }
}

Future sendpost(message, date, hardwareid) async {
  try {
    var meet = await post(
      Uri.parse("https://codepay.guavacodeplus.tech/asumapost.php"),
      body: {
        "HardwareId": hardwareid,
        "Message": message,
        "Date": date,
      },
    );
    // print(meet.body);
    if (meet.statusCode == 200) {
      return json.decode(meet.body);
    } else {
      throw Exception();
    }
  } catch (e) {
    rethrow;
  }
}
