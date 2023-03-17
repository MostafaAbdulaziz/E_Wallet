import 'package:ewallet/utils/Lists.dart';
import 'package:ewallet/utils/Strings.dart';
import 'package:ewallet/utils/formkeys.dart';
import 'package:ewallet/utils/functions.dart';
import 'package:ewallet/utils/texteditcontrollers.dart';
import 'package:ewallet/views/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class UpdateUserDataScreen extends StatelessWidget {
  const UpdateUserDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          alignment: Alignment.center,
          decoration: decorOfBackground(),
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(20),
              decoration: decorOfContainer(),
              child: Form(
                key: updateDataFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textOfApp(text: 'Update Data',font: 35),
                    const SizedBox(height: 40),
                    textFormField(
                        hintText: 'name',
                        icon: const Icon(
                          Icons.person,
                          color: Colors.black,
                          size: 25,
                        ),
                        textInputType: TextInputType.name,
                        controller: userNameController,
                        textValidator: 'please enter new name'),
                    const SizedBox(
                      height: 15,
                    ),
                    textFormField(
                        controller: userMailController,
                        hintText: 'email',
                        icon: const Icon(
                          Icons.email,
                          color: Colors.black,
                          size: 25,
                        ),
                        textInputType: TextInputType.emailAddress,
                        textValidator: 'please enter your new mail'),
                    const SizedBox(
                      height: 15,
                    ),
                    // textFormField(
                    //   controller: genderController,
                    //   hintText: 'Gender',
                    //   icon: const Icon(
                    //     Icons.person_add_outlined,
                    //     color: Colors.black,
                    //     size: 25,
                    //   ),
                    //   textInputType: TextInputType.text,
                    //   textValidator: 'please enter your Gender',
                    // ),

                    dropDownItemBottom(
                        itemsList: itemsGender
                            .map((e) => DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        ))
                            .toList(),
                        value: selectedValOfGender,
                        function: (String value)
                        {
                          gender=value;
                          selectedValOfGender = value as String;
                        }
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    textFormField(
                        controller: phoneUserController,
                        hintText: 'Phone',
                        icon: const Icon(
                          Icons.phone,
                          color: Colors.black,
                          size: 25,
                        ),
                        textInputType: TextInputType.phone,
                        textValidator: 'please enter your phone',
                      inputFormatter: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    textFormField(
                        controller: moneyUserController,
                        hintText: 'Money',
                        icon: Icon(
                          Icons.money,
                          color: Colors.black.withOpacity(0.8),
                          size: 25,
                        ),
                        textInputType: TextInputType.number,
                        textValidator: 'please enter your number of money',
                      inputFormatter: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    textFormField(
                        controller: userBirthDateController,
                        hintText: 'expiry date',
                        icon: const Icon(
                          Icons.date_range,
                          color: Colors.black,
                          size: 25,
                        ),
                        textValidator: 'please enter date',
                        onTap: () {
                          showDate(context,controllerText: userBirthDateController);
                        }),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: materButton(function: () {
                              Navigator.of(context).pop();
                            }, text: 'BACK')),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                            child:
                            materButton(function: () {
                             if(updateDataFormKey.currentState!.validate()){
                               updateUserData();
                             }

                            }, text: 'Update')),
                      ],
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
