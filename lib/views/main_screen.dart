import 'package:ewallet/shared/Cubits/Main_cubit/main_cubit.dart';
import 'package:ewallet/shared/Cubits/Main_cubit/main_states.dart';
import 'package:ewallet/utils/Lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MainCubit(),
      child: BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(
                Icons.house,
              ), label: 'Home'),
              BottomNavigationBarItem(
                  icon:Icon(
                    Icons.receipt_long,
                  ), label: 'Transactions'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.signal_cellular_alt,
                  ),
                  label: 'Statistics'),
              BottomNavigationBarItem(icon: Icon(
                Icons.paid,
              ), label: 'Push'),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
            ],
            currentIndex: MainCubit.get(context).currentIndex,
            onTap: (index) =>
                MainCubit.get(context).replaceBetweenScreens(index),
          ),
          body: screens[MainCubit.get(context).currentIndex],
        ),
      ),
    );
  }
}
