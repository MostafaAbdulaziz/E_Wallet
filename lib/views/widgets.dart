import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../utils/Strings.dart';

Widget textOfApp({
  required String text,
  Color color = Colors.black,
  double font = 30,
}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: font,
      fontWeight: FontWeight.bold,
    ),
    textAlign: TextAlign.center,
  );
}

Widget textFormField({
  required String hintText,
  Widget? icon,
  TextInputType? textInputType,
  required TextEditingController controller,
  Widget? suffixIcon,
  required String textValidator,
  bool obscureText = false,
  Function()? onTap,
  double font = 17,
  int? countNumber,
  List<TextInputFormatter>? inputFormatter,
}) {
  return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: icon,
        suffixIcon: suffixIcon,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      keyboardType: textInputType,
      controller: controller,
      style: TextStyle(
        fontSize: font,
        fontWeight: FontWeight.bold,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return textValidator;
        }
        return null;
      },
      obscureText: obscureText,
      onTap: onTap,
      inputFormatters: inputFormatter);
}

Widget materButton(
    {required Function() function,
    required String text,
    double width = double.infinity}) {
  return Container(
    decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Colors.blue,
            Colors.white,
            Colors.blue,
          ],
          end: Alignment.bottomCenter,
          begin: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(20)),
    child: MaterialButton(
      onPressed: function,
      minWidth: width,
      height: 45,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: textOfApp(text: text, font: 18, color: Colors.black),
    ),
  );
}

BoxDecoration decorOfBackground() {
  return const BoxDecoration(
      gradient: LinearGradient(
    colors: [Colors.white24, Colors.grey],
    begin: Alignment.bottomCenter,
    end: Alignment.topRight,
  ));
}

BoxDecoration decorOfContainer() {
  return const BoxDecoration(
    borderRadius: BorderRadius.only(topRight: Radius.circular(40)),
    boxShadow: [
      BoxShadow(color: Colors.black, offset: Offset(20, 20), blurRadius: 18),
    ],
    gradient: LinearGradient(
      colors: [Colors.black, Colors.grey],
      begin: Alignment.bottomCenter,
      end: Alignment.topRight,
    ),
  );
}

Widget textButton(
    {required Function() function, required String textOfButton}) {
  return TextButton(
    onPressed: function,
    child: textOfApp(text: textOfButton, color: Colors.blue, font: 15),
  );
}

Widget iconButtonOfPass({
  required Function() function,
  required IconData icon,
}) {
  return IconButton(
      onPressed: function,
      icon: Icon(
        icon,
        color: Colors.black.withOpacity(0.8),
        size: 25,
      ));
}

void countNumbers({
  required String message,
  required Color backColor,
  required Color textColor,
}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      backgroundColor: backColor,
      timeInSecForIosWeb: 10,
      textColor: textColor,
      fontSize: 16.0);
}

void alertScreen(
    {required BuildContext context,
    required String title,
    required String textButton,
    required Function() function,
    required Widget contentOfAlert}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: contentOfAlert,
        actions: <Widget>[
          ElevatedButton(
            onPressed: function,
            child: Text(textButton),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      );
    },
  );
}

DropdownButtonFormField dropDownItemBottom(
    {required List<DropdownMenuItem> itemsList,
    required Function function,
    required dynamic value}) {
  return DropdownButtonFormField(
    decoration: InputDecoration(
      isDense: true,
      prefixIcon: const Icon(Icons.type_specimen_outlined),
      fillColor: Colors.white,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      hintText: 'Gender',
      hintStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
    ),
    borderRadius: BorderRadius.circular(20),
    items: itemsList,
    onChanged: (value) => function(value),
    value: value,
    validator: (value) {
      if (value!.isEmpty) {
        return 'please enter Your Gender';
      }
      return null;
    },
  );
}
