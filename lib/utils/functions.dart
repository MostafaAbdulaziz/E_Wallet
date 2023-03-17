import 'package:ewallet/utils/Strings.dart';
import 'package:ewallet/utils/formkeys.dart';
import 'package:ewallet/utils/texteditcontrollers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../views/widgets.dart';

void onTapChargeType(context, index) {
  if (index == 0) {
    alertScreen(
      context: context,
      title: 'Fawry Code',
      textButton: 'Charge',
      function: () {
        actionOfOperations(context);
      },
      contentOfAlert: textFormField(
          hintText: 'enter number',
          controller: fawryController,
          textValidator: 'please enter number',
          textInputType: TextInputType.number,
          inputFormatter: [
            LengthLimitingTextInputFormatter(9),
            FilteringTextInputFormatter.digitsOnly
          ]),
    );
  } else if (index == 1) {
    alertScreen(
      context: context,
      title: 'withdraw ATM',
      textButton: 'Charge',
      function: () {
        actionOfOperations(context);
      },
      contentOfAlert: textFormField(
          hintText: 'enter number',
          controller: atmController,
          textValidator: 'please enter number',
          textInputType: TextInputType.number,
          inputFormatter: [
            LengthLimitingTextInputFormatter(6),
            FilteringTextInputFormatter.digitsOnly
          ]),
    );
  } else if (index == 2) {
    alertScreen(
      context: context,
      title: 'transFer to another wallet',
      textButton: 'Transfer',
      function: () {
        actionOfOperations(context);
      },
      contentOfAlert: textFormField(
          hintText: 'enter number of another wallet',
          controller: tranToAnWalletController,
          textValidator: 'please enter number',
          textInputType: TextInputType.number,
          font: 14,
          inputFormatter: [
            LengthLimitingTextInputFormatter(12),
            FilteringTextInputFormatter.digitsOnly
          ]),
    );
  } else {
    alertScreen(
      context: context,
      title: 'transfer to a bank account',
      textButton: 'Transfer',
      function: () {
        actionTransfer(context);
      },
      contentOfAlert: textOfApp(
        text: 'Do you want to transfer to your bank account?',
        font: 15,
      ),
    );
  }
}

void actionOfOperations(context) {
  if (fawryController.text.length == 9 ||
      atmController.text.length == 6 ||
      tranToAnWalletController.text.length == 12) {
    fawryController.text = '';
    atmController.text = '';
    tranToAnWalletController.text = '';
    Navigator.of(context).pop();
    countNumbers(
        message: 'operation accomplished successfully',
        backColor: Colors.green,
        textColor: Colors.white);
  } else {
    countNumbers(
        message: 'ُEnter The  Correct Number',
        backColor: Colors.red,
        textColor: Colors.white);
  }
}

void actionTransfer(context) {
  Navigator.of(context).pop();
  countNumbers(
      message: 'operation accomplished successfully',
      backColor: Colors.green,
      textColor: Colors.white);
}

void showDate(context, {required TextEditingController controllerText}) {
  showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2022),
    lastDate: DateTime(2030),
  ).then((value) {
    controllerText.text = DateFormat.yMMMd().format(value!.toUtc());
  });
}

void backFromCardToHome(context) {
  holderNameController.text = '';
  typeCardController.text = '';
  numCardController.text = '';
  verifiedNumController.text = '';
  expiryDateController.text = '';
  alertController.text = '';
  alertPasswordController.text = '';
  Navigator.of(context).pushNamedAndRemoveUntil('mainScreen', (route) => false);
}

void chargeOperation(context) {
  if (cardFormKey.currentState!.validate() &&
      expiryDateController.text != 'null') {
    alertScreen(
        context: context,
        title: 'Charge Value',
        contentOfAlert: textFormField(
          hintText: 'enter charge value',
          controller: alertController,
          textValidator: 'please enter charge value',
          textInputType: TextInputType.number,
          inputFormatter: [FilteringTextInputFormatter.digitsOnly],
        ),
        textButton: 'NEXT',
        function: () {
          operationOfChargeValue(context);
        });
  }
}

void operationOfChargeValue(context) {
  if (alertController.text.isNotEmpty) {
    alertScreen(
        context: context,
        title: 'confirm charge operation',
        contentOfAlert: textFormField(
            hintText: 'enter account\'s password',
            controller: alertPasswordController,
            textValidator: 'please enter account\'s password',
            textInputType: TextInputType.number),
        textButton: 'Ok',
        function: () {
          if (alertPasswordController.text.isNotEmpty) {
            allDateOfChargeTrue(context);
          } else {
            countNumbers(
                message: 'please enter account\'s password',
                backColor: Colors.red,
                textColor: Colors.white);
          }
        });
  } else {
    countNumbers(
        message: 'Enter Charge Value',
        backColor: Colors.red,
        textColor: Colors.white);
  }
}

void allDateOfChargeTrue(context) {
  holderNameController.text = '';
  typeCardController.text = '';
  numCardController.text = '';
  verifiedNumController.text = '';
  expiryDateController.text = '';
  alertController.text = '';
  alertPasswordController.text = '';
  Navigator.of(context).pushReplacementNamed('cardScreen');
  countNumbers(
      message: 'operation accomplished successfully',
      backColor: Colors.green,
      textColor: Colors.white);
}

void signupAccount(context) {
  loginPasswordController.text = '';
  loginEmailController.text = '';
  verifiedCodeController.text = '';
  signupPasswordController.text = '';
  confirmPasswordController.text = '';
  firstNameController.text = '';
  lastNameController.text = '';
  phoneController.text = '';
  signupEmailController.text = '';
  Navigator.of(context).pushReplacementNamed('loginScreen');
}

void addTransaction(context) {
  nameController.text = '';
  operationController.text = '';
  dateOperationController.text = '';
  moneyController.text = '';
  countNumbers(
      message: 'Operation added successfully',
      backColor: Colors.green,
      textColor: Colors.white);
  Navigator.of(context).pop();
}

void updateUserData() {
  name = userNameController.text;
  mail = userMailController.text;
  birthDate = userBirthDateController.text;
  gender = genderController.text;
  phone = phoneUserController.text;
  money = moneyUserController.text;

  userNameController.text = '';
  userMailController.text = '';
  userBirthDateController.text = '';
  genderController.text = '';
  phoneUserController.text = '';
  moneyUserController.text = '';

  countNumbers(
      message: 'Update accomplished successfully',
      backColor: Colors.green,
      textColor: Colors.white);
}
