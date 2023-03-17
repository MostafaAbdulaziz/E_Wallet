import 'package:ewallet/shared/Cubits/Login_cubit/login_cubit.dart';
import 'package:ewallet/shared/Cubits/Login_cubit/login_states.dart';
import 'package:ewallet/utils/formkeys.dart';
import 'package:ewallet/utils/texteditcontrollers.dart';
import 'package:ewallet/views/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
          body: SafeArea(
            child: Container(
              alignment: Alignment.center,
              height: double.infinity,
              decoration: decorOfBackground(),
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.all(20),
                  decoration: decorOfContainer(),
                  child: Form(
                    key: loginFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textOfApp(text: 'Login',font: 35),
                        const SizedBox(height: 40),
                        textFormField(
                            hintText: 'Email or Phone number',
                            icon: const Icon(
                              Icons.email_outlined,
                              color: Colors.black,
                              size: 25,
                            ),
                            textInputType: TextInputType.emailAddress,
                            controller: loginEmailController,
                            textValidator: 'please enter your mail'),
                        const SizedBox(
                          height: 15,
                        ),
                        textFormField(
                            hintText: 'Password',
                            suffixIcon: iconButtonOfPass(
                                function: () =>
                                    LoginCubit.get(context).changeIconPass(),
                                icon: LoginCubit.get(context).icon),
                            textInputType: TextInputType.visiblePassword,
                            controller: loginPasswordController,
                            textValidator: 'please enter your password',
                            icon: Icon(
                              Icons.lock,
                              color: Colors.black.withOpacity(0.8),
                              size: 25,
                            ),
                            obscureText: LoginCubit.get(context).isNotVisible),
                        const SizedBox(
                          height: 15,
                        ),
                        materButton(
                            function: () {
                              if (loginFormKey.currentState!.validate()) {
                                Navigator.of(context)
                                    .pushReplacementNamed("verifiedScreen");
                              }
                            },
                            text: 'LOGIN'),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            textOfApp(
                                text: 'don\'t have an account?',
                                font: 15,
                                color: Colors.white),
                            textButton(
                                function: () {
                                  Navigator.of(context)
                                      .pushNamedAndRemoveUntil('signupScreen',(route) => false,);
                                },
                                textOfButton: "Register")
                          ],
                        )
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
