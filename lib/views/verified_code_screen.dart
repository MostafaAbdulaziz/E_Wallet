
import 'package:ewallet/utils/formkeys.dart';
import 'package:ewallet/utils/texteditcontrollers.dart';
import 'package:ewallet/views/widgets.dart';
import 'package:flutter/material.dart';

class VerifiedScreen extends StatelessWidget {
  const VerifiedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          alignment: Alignment.center,
          decoration:  decorOfBackground(),
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(20),
            decoration: decorOfContainer() ,
            child: Form(
              key: verifiedFormKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textOfApp(text: 'Verification',color: Colors.white,font: 25),
                    const SizedBox(height: 40),
                    const SizedBox(
                      height: 15,
                    ),
                    textOfApp(text: 'Please verified your mail',font: 15,color: Colors.white),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        textOfApp(text: 'Code',font: 18,color: Colors.white),
                        const SizedBox(width: 10,),
                        Expanded(
                          child: textFormField(
                              hintText: 'verified Code',
                              textInputType: TextInputType.text,
                            controller: verifiedCodeController,
                              textValidator: 'please enter verified code'
                          ),
                        ),                    ],
                    ),
                    const SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.only(left: 55),
                      child: materButton(
                          function: () {
                              if(verifiedFormKey.currentState!.validate()){
                                Navigator.of(context).pushReplacementNamed("mainScreen");
                              }
                          }, text: 'VERIFIED'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
