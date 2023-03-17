import 'package:ewallet/utils/Lists.dart';
import 'package:ewallet/utils/formkeys.dart';
import 'package:ewallet/utils/functions.dart';
import 'package:ewallet/utils/texteditcontrollers.dart';
import 'package:ewallet/views/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: decorOfBackground(),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 18,
                            color: Colors.black,
                            offset: Offset(-5, 15)),
                      ],
                      gradient: const LinearGradient(
                        colors: [Colors.black, Colors.grey],
                        end: Alignment.bottomCenter,
                        begin: Alignment.topRight,
                      ),
                      border: Border.all(
                        color: Colors.black,
                        width: 0.5,
                      )),
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        itemOfTransactionsList(index),
                    itemCount: dataTransactions.length,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => allTransactions(index),
                  itemCount: allDataTransactions.length,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'transaction',
        backgroundColor: Colors.blueAccent,
        onPressed: () {
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30))),
            context: context,
            builder: (context) {
              return Form(
                key: transFormKey,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        textFormField(
                            hintText: 'name',
                            icon: const Icon(
                              Icons.person_add,
                              color: Colors.black,
                              size: 25,
                            ),
                            textInputType: TextInputType.name,
                            controller: nameController,
                            textValidator: 'please enter name'),
                        const SizedBox(
                          height: 15,
                        ),
                        textFormField(
                            hintText: 'Operation',
                            icon: const Icon(
                              Icons.business_center,
                              color: Colors.black,
                              size: 25,
                            ),
                            textInputType: TextInputType.text,
                            controller: operationController,
                            textValidator: 'please enter operation'),
                        const SizedBox(
                          height: 15,
                        ),
                        textFormField(
                            hintText: 'Money',
                            icon: const Icon(
                              Icons.money,
                              color: Colors.black,
                              size: 25,
                            ),
                            textInputType: TextInputType.number,
                            controller: moneyController,
                            textValidator: 'please enter money',
                            inputFormatter: [
                              FilteringTextInputFormatter.digitsOnly
                            ]),
                        const SizedBox(
                          height: 15,
                        ),
                        textFormField(
                            hintText: 'Operation Date',
                            icon: const Icon(
                              Icons.date_range,
                              color: Colors.black,
                              size: 25,
                            ),
                            textInputType: TextInputType.datetime,
                            controller: dateOperationController,
                            textValidator: 'please enter Date',
                            onTap: () {
                              showDate(context, controllerText: dateOperationController);
                            }),
                        const SizedBox(
                          height: 15,
                        ),
                        materButton(
                            function: () {
                              if (transFormKey.currentState!.validate()) {
                                addTransaction(context);
                              }
                            },
                            text: 'ADD OPERATION')
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add_business_rounded),
      ),
    );
  }
}

Widget itemOfTransactionsList(int index) => Container(
      width: 150,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: const [
          BoxShadow(blurRadius: 18, color: Colors.black, offset: Offset(0, 10)),
        ],
        gradient: const LinearGradient(
          colors: [Colors.black, Colors.grey],
          begin: Alignment.bottomCenter,
          end: Alignment.topRight,
        ),
        border: Border.all(color: Colors.black, width: 0.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            child: dataTransactions[index]['icon'],
            backgroundColor: Colors.blueAccent,
          ),
          const SizedBox(
            height: 10,
          ),
          textOfApp(
            text: dataTransactions[index]['text'],
            font: 16,
            color: Colors.white,
          )
        ],
      ),
    );

Widget allTransactions(int index) => Container(
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      boxShadow: const [
        BoxShadow(blurRadius: 18, color: Colors.black, offset: Offset(-5, 15)),
      ],
      gradient: const LinearGradient(
        colors: [Colors.black, Colors.grey],
        begin: Alignment.bottomCenter,
        end: Alignment.topRight,
      ),
      border: Border.all(color: Colors.black, width: 0.7),
    ),
    child: ListTile(
      leading: allDataTransactions[index]['icon'],
      title: Text(
        allDataTransactions[index]['name'],
        style: const TextStyle(fontSize: 15, color: Colors.white),
      ),
      subtitle: Text(
        allDataTransactions[index]['operation'],
        style: const TextStyle(color: Colors.white, fontSize: 10),
      ),
      trailing: Column(
        children: [
          textOfApp(
              text: allDataTransactions[index]['count'],
              font: 18,
              color: Colors.white),
          const SizedBox(height: 10),
          Text(
            allDataTransactions[index]['date'],
            style: const TextStyle(color: Colors.white, fontSize: 10),
          ),
        ],
      ),
    ));
