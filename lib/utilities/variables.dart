import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartwristband/utilities/appText.dart';

import 'color.dart';

Widget inputFeild(String label, String hint, _controller,
    {bool obsc = false,
    bool enable = true,
    TextInputType keyboard = TextInputType.name,
    len = 500,
    lineheight = 1}) {
  return TextField(
    enabled: enable,
    cursorColor: Colors.black,
    style: GoogleFonts.urbanist(
      fontSize: 14,
      color: Colors.black,
      fontWeight: FontWeight.w300,
    ),

    decoration: InputDecoration(
      labelText: label,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.grey, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.grey, width: 1.5),
      ),
      hintText: hint,
      counterText: "",
    ),
    keyboardType: keyboard,
    controller: _controller,
    obscureText: obsc,
    maxLength: len,
    maxLines: lineheight,
    // controller: _controller,
  );
}

var themedata = ThemeData(
  brightness: Brightness.light,
  // accentColor: Colors.orange,
  // primarySwatch: Colors.orange,
  colorScheme: ColorScheme.light(primary: pcolor),

  inputDecorationTheme: InputDecorationTheme(
    fillColor: const Color.fromARGB(255, 241, 245, 248),
    filled: true,
    floatingLabelStyle: const TextStyle(color: Colors.black),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: pcolor,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Colors.grey,
        width: 1.0,
      ),

      // color: Color.fromARGB(255, 240, 240, 240),
      // width: 2.0,
    ),
    prefixIconColor: const Color.fromARGB(255, 27, 24, 24),
    hintStyle: GoogleFonts.urbanist(
      fontSize: 12,
      color: Colors.grey,
    ),
    labelStyle: GoogleFonts.urbanist(
      fontSize: 12,
      color: const Color.fromARGB(255, 49, 48, 48),
    ),
  ),
);

String serial = "topik";
String uname = "";


// overlaySuccess(text, {Color color = Colors.green}) {
//   return showSimpleNotification(title(text, color: Colors.white),
//       background: color);
// }

// overlayError(text, {Color color = Colors.red}) {
//   return showSimpleNotification(title(text, color: Colors.white),
//       background: color);
// }
