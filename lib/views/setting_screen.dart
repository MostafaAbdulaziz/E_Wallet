import 'package:ewallet/utils/Strings.dart';
import 'package:ewallet/utils/functions.dart';
import 'package:ewallet/utils/texteditcontrollers.dart';
import 'package:ewallet/views/widgets.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: decorOfBackground(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    const CircleAvatar(
                      radius: 55,
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
                    ),
                    CircleAvatar(
                      radius: 17,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.camera_alt_outlined,
                        ),
                        iconSize: 20,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                textOfApp(text: 'Mostafa Abdulaziz', font: 18),
                const SizedBox(
                  height: 5,
                ),
                textOfApp(
                    text: 'Choose People Who Choose You',
                    font: 15,
                    color: Colors.black.withOpacity(0.5)),
                const SizedBox(
                  height: 40,
                ),
                textOfApp(
                    text: 'Name: $name',
                    font: 18,
                    color: Colors.black),
                const SizedBox(
                  height: 10,
                ),
                textOfApp(
                    text: 'Email: $mail',
                    font: 18,
                    color: Colors.black),
                const SizedBox(
                  height: 10,
                ),
                textOfApp(
                    text: 'Birth Date: $birthDate',
                    font: 18,
                    color: Colors.black),
                const SizedBox(
                  height: 10,
                ),
                textOfApp(text: 'Gender: $gender', font: 18, color: Colors.black),
                const SizedBox(
                  height: 10,
                ),
                textOfApp(
                    text: 'Phone: $phone', font: 18, color: Colors.black),
                const SizedBox(
                  height: 10,
                ),
                textOfApp(text: 'money: $money', font: 18, color: Colors.black),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Container(
                            decoration: const BoxDecoration(boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  offset: Offset(5, 8),
                                  blurRadius: 18)
                            ]),
                            child: materButton(
                                function: () {
                                  Navigator.of(context).pushNamed('updateDataScreen');
                                }, text: 'Update Profile'))),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                        child: Container(
                            decoration: const BoxDecoration(boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  offset: Offset(5, 8),
                                  blurRadius: 18)
                            ]),
                            child:
                                materButton(function: () {
                                  signupAccount(context);
                                }, text: 'Sign up'))),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
