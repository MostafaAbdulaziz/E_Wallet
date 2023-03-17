import 'package:ewallet/shared/Cubits/Signup_cubit/sign_up_cubit.dart';
import 'package:ewallet/shared/Cubits/Signup_cubit/sign_up_states.dart';
import 'package:ewallet/utils/formkeys.dart';
import 'package:ewallet/utils/texteditcontrollers.dart';
import 'package:ewallet/views/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>SignupCubit(),
      child: BlocConsumer<SignupCubit,SignupStates>(
        listener: (context,state){},
        builder: (context,state)=>Scaffold(
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
                    key: signupFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textOfApp(text: 'Sign Up',font: 35),
                        const SizedBox(height: 40),
                        textFormField(
                            hintText: 'First Name',
                            icon: const Icon(
                              Icons.person,
                              color: Colors.black,
                              size: 25,
                            ),
                            textInputType: TextInputType.name,
                            controller: firstNameController,
                            textValidator: 'please enter your first name'),
                        const SizedBox(
                          height: 15,
                        ),
                        textFormField(
                            controller: lastNameController,
                            hintText: 'Last Name',
                            icon: const Icon(
                              Icons.person,
                              color: Colors.black,
                              size: 25,
                            ),
                            textInputType: TextInputType.name,
                            textValidator: 'please enter your last name'),
                        const SizedBox(
                          height: 15,
                        ),
                        textFormField(
                            controller: phoneController,
                            hintText: 'Phone number',
                            icon: const Icon(
                              Icons.phone,
                              color: Colors.black,
                              size: 25,
                            ),
                            textInputType: TextInputType.phone,
                            textValidator: 'please enter your phone number',
                          inputFormatter: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        textFormField(
                            controller: signupEmailController,
                            hintText: 'Email',
                            icon: const Icon(
                              Icons.email_outlined,
                              color: Colors.black,
                              size: 25,
                            ),
                            textInputType: TextInputType.emailAddress,
                            textValidator: 'please enter your mail'),
                        const SizedBox(
                          height: 15,
                        ),
                        textFormField(
                            controller: signupPasswordController,
                            hintText: 'Password',
                            icon: Icon(
                              Icons.lock,
                              color: Colors.black.withOpacity(0.8),
                              size: 25,
                            ),
                            textInputType: TextInputType.visiblePassword,
                            suffixIcon: iconButtonOfPass(
                                function: () =>
                                    SignupCubit.get(context).changeIconPass(),
                                icon: SignupCubit.get(context).iconPass),
                            textValidator: 'please enter your password',
                          obscureText: SignupCubit.get(context).isNotVisiblePass
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        textFormField(
                            controller: confirmPasswordController,
                            hintText: 'Confirm password',
                            icon: Icon(
                              Icons.lock,
                              color: Colors.black.withOpacity(0.8),
                              size: 25,
                            ),
                            suffixIcon: iconButtonOfPass(
                                function: () =>
                                    SignupCubit.get(context).changeIconConfirmPass(),
                                icon: SignupCubit.get(context).iconConfirmPass),
                            obscureText: SignupCubit.get(context).isNotVisibleConfirmPass,
                            textInputType: TextInputType.visiblePassword,
                            textValidator: 'please enter your confirm password'
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        materButton(
                            function: () {
                              if(signupFormKey.currentState!.validate())
                              {
                                Navigator.of(context)
                                    .pushReplacementNamed("verifiedScreen");
                              }
                            },
                            text: 'SIGN UP'),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            textOfApp(
                                text: 'are you have Account ?',
                                font: 15,
                                color: Colors.white),
                            textButton(
                                function: () {
                                  Navigator.of(context)
                                      .pushReplacementNamed("loginScreen");
                                },
                                textOfButton: "LogIn")
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
