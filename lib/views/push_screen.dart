import 'package:ewallet/shared/Cubits/Main_cubit/main_cubit.dart';
import 'package:ewallet/shared/Cubits/Main_cubit/main_states.dart';
import 'package:ewallet/utils/formkeys.dart';
import 'package:ewallet/utils/texteditcontrollers.dart';
import 'package:ewallet/views/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class PushScreen extends StatelessWidget {
  const PushScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>MainCubit(),
      child: BlocConsumer<MainCubit,MainStates>(
        listener: (context,state){},
        builder: (context,state)=>Scaffold(
          body: SafeArea(
            child: Container(
              height: double.infinity,
              alignment: Alignment.center,
              decoration: decorOfBackground(),
              child: Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 18,
                          color: Colors.black,
                          offset: Offset(10, 15)),
                    ],
                    gradient: const LinearGradient(
                      colors: [Colors.black, Colors.grey],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topRight,
                    ),
                    border: Border.all(
                      color: Colors.black,
                      width: 0.5,
                    )),
                child: Form(
                  key: pushFormKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if(state is LoadingsState)
                        const LinearProgressIndicator(),
                        textOfApp(
                            text: 'Push your Bills', color: Colors.white, font: 25),
                        const SizedBox(height: 40),
                        const SizedBox(
                          height: 15,
                        ),
                        textOfApp(
                            text: 'Please Enter your Push Code',
                            font: 15,
                            color: Colors.white),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            textOfApp(text: 'Code', font: 18, color: Colors.white),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: textFormField(
                                  hintText: 'Push Code',
                                  textInputType: TextInputType.text,
                                  controller: pushCodeController,
                                  textValidator: 'please enter push code',
                                countNumber: 12,
                                inputFormatter: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(12),
                                ]
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 55),
                          child: materButton(
                              function: () {
                                if (pushFormKey.currentState!.validate()) {
                                  MainCubit.get(context).actionButton();
                                }
                              },
                              text: 'PUSH'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
