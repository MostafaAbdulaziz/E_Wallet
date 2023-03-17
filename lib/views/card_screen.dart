import 'package:ewallet/utils/Lists.dart';
import 'package:ewallet/utils/Strings.dart';
import 'package:ewallet/utils/formkeys.dart';
import 'package:ewallet/utils/functions.dart';
import 'package:ewallet/utils/texteditcontrollers.dart';
import 'package:ewallet/views/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';



class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(15),
          decoration: decorOfBackground(),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: cardFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textOfApp(text: 'Credit Card Data'),
                  const SizedBox(height: 40),
                  textFormField(
                      hintText: 'your name',
                      icon: const Icon(
                        Icons.person,
                        color: Colors.black,
                        size: 25,
                      ),
                      textInputType: TextInputType.name,
                      controller: holderNameController,
                      textValidator: 'please enter your name'),
                  const SizedBox(
                    height: 15,
                  ),
                  dropDownItemBottom(
                    itemsList: itemsDropDown
                        .map((e) => DropdownMenuItem(
                      child: Text(e),
                      value: e,
                    ))
                        .toList(),
                    value: selectedValOfCardType,
                    function: (String value)=>selectedValOfCardType = value as String,

                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  textFormField(
                    controller: numCardController,
                    hintText: 'number',
                    icon: const Icon(
                      Icons.credit_card,
                      color: Colors.black,
                      size: 25,
                    ),
                    textInputType: TextInputType.number,
                    textValidator: 'please enter number',
                    inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  textFormField(
                    controller: verifiedNumController,
                    hintText: 'verification number',
                    icon: const Icon(
                      Icons.confirmation_number,
                      color: Colors.black,
                      size: 25,
                    ),
                    textInputType: TextInputType.number,
                    textValidator: 'please enter number again',
                    inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  textFormField(
                      controller: expiryDateController,
                      hintText: 'expiry date',
                      icon: const Icon(
                        Icons.date_range,
                        color: Colors.black,
                        size: 25,
                      ),
                      textValidator: 'please enter date',
                      onTap: () {
                        showDate(context,controllerText: expiryDateController);
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: materButton(function: () {
                            backFromCardToHome(context);
                          }, text: 'BACK')),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                          child:
                          materButton(function: () {
                            chargeOperation(context);
                          }, text: 'NEXT')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
