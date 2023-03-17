import 'package:ewallet/views/home_scren.dart';
import 'package:ewallet/views/push_screen.dart';
import 'package:ewallet/views/setting_screen.dart';
import 'package:ewallet/views/statistic_screen.dart';
import 'package:ewallet/views/transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

List dataOfChargeItems = [
  {
    'text': 'Fawry Code',
    'image': 'assets/images/fawry.png',
  },
  {
    'text': 'withdraw ATM',
    'image': 'assets/images/atm.png',
  },
  {
    'text': 'transFer to another wallet',
    'image': 'assets/images/wallet.jpg',
  },
  {
    'text': 'transfer to a bank account',
    'image': 'assets/images/bankaccount.png',
  },

];

List dataOfGridItems = [
  {
    'text': 'Fawry Services',
    'image': 'assets/images/fawry.png',
  },
  {
    'text': 'Pay your bills',
    'image': 'assets/images/bills.jpg',
  },
  {
    'text': 'save your money',
    'image': 'assets/images/save_money.jpg',
  },
  {
    'text': 'your shares',
    'image': 'assets/images/shares.png',
  },
];

List dataTransactions = [
  {
    'text': 'Send',
    'icon': const Icon(Icons.local_shipping,size: 45,color: Colors.white,),
  },
  {
    'text': 'Transfer',
    'icon': const Icon(
      Icons.transfer_within_a_station,
      size: 45,color: Colors.white,
    ),
  },
  {
    'text': 'PassBook',
    'icon': const Icon(
      Icons.menu_book,
      size:25 ,
    ),
  },
];

List allDataTransactions = [
  {
    'name': 'Mostafa Abdulaziz',
    'icon': const  CircleAvatar(
      radius: 35,
      backgroundColor: Colors.blueAccent,
      child: Icon(
        Icons.transfer_within_a_station,
        size: 35,color: Colors.white,
      ),
    ),
    'operation':'Transferred',
    'count':'1200 EG',
    'date':'01 April 2022'
  },
  {
    'name': 'Mostafa Mohamed',
    'icon': const  CircleAvatar(
      radius: 35,
      backgroundColor: Colors.blueAccent,
      child: Icon(Icons.local_shipping,color: Colors.white,size: 35,),
    ),
    'operation':'Send',
    'count':'100 EG',
    'date':'05 April 2022'
  },
  {
    'name': 'Ahmed Mohamed',
    'icon': const  CircleAvatar(
      radius: 35,
      backgroundColor: Colors.blueAccent,
      child: Icon(
        Icons.transfer_within_a_station,
        size: 35,color: Colors.white,
      ),
    ),
    'operation':'Transferred',
    'count':'250 EG',
    'date':'10 April 2022'
  },
  {
    'name': 'Ali Mohamed',
    'icon': const  CircleAvatar(
      radius: 35,
      backgroundColor: Colors.blueAccent,
      child: Icon(
        Icons.menu_book,
        size:25 ,
      ),
    ),
    'operation':'PassBook',
    'count':'400 EG',
    'date':'15 April 2022'
  },
  {
    'name': 'Ahmed Mohamed',
    'icon': const CircleAvatar(
      radius: 35,
      backgroundColor: Colors.blueAccent,
      child: Icon(
        Icons.menu_book,
        size:25 ,
      ),
    ),
    'operation':'Transferred',
    'count':'250 EG',
    'date':'10 April 2022'
  },
  {
    'name': 'Ali Mohamed',
    'icon': const CircleAvatar(
      radius: 35,
      backgroundColor: Colors.blueAccent,
      child: Icon(
        Icons.menu_book,
        size:25 ,
      ),
    ),
    'operation':'PassBook',
    'count':'400 EG',
    'date':'15 April 2022'
  },
  {
    'name': 'Mostafa Abdulaziz',
    'icon': const  CircleAvatar(
      radius: 35,
      backgroundColor: Colors.blueAccent,
      child: Icon(
        Icons.transfer_within_a_station,
        size: 45,color: Colors.white,
      ),
    ),
    'operation':'Transferred',
    'count':'1200 EG',
    'date':'01 April 2022'
  },
  {
    'name': 'Mostafa Mohamed',
    'icon': const  CircleAvatar(
      radius: 35,
      backgroundColor: Colors.blueAccent,
      child: Icon(Icons.local_shipping),
    ),
    'operation':'Send',
    'count':'100 EG',
    'date':'05 April 2022'
  },
  {
    'name': 'Ahmed Mohamed',
    'icon': const  CircleAvatar(
      radius: 35,
      backgroundColor: Colors.blueAccent,
      child: Icon(
        Icons.transfer_within_a_station,
        size: 45,color: Colors.white,
      ),
    ),
    'operation':'Transferred',
    'count':'250 EG',
    'date':'10 April 2022'
  },
  {
    'name': 'Ali Mohamed',
    'icon': const  CircleAvatar(
      radius: 35,
      backgroundColor: Colors.blueAccent,
      child: Icon(
        Icons.menu_book,
        size:25 ,
      ),
    ),
    'operation':'PassBook',
    'count':'400 EG',
    'date':'15 April 2022'
  },
];

List screens = [
  const HomeScreen(),
  const TransactionsScreen(),
  const StatisticsScreen(),
  const PushScreen(),
  const SettingsScreen(),
];

List<String> itemsDropDown=['Current','Saving','credit'];
List<String> itemsGender=['Male','Female'];


List allDataStatistic = [
  {
    'name': 'lamp company',
    'icon': const  CircleAvatar(
      radius: 35,
      backgroundColor: Colors.blueAccent,
      child: Icon(
        Icons.fire_truck,
        size: 35,color: Colors.white,
      ),
    ),
    'startDate':'12 April 2020',
    'count':'12000 EG',
  },
  {
    'name': 'Car showroom',
    'icon': const  CircleAvatar(
      radius: 35,
      backgroundColor: Colors.blueAccent,
      child: Icon(
        Icons.car_crash,
        size: 35,color: Colors.white,
      ),
    ),
    'startDate':'20 April 2020',
    'count':'10000 EG',
  },
  {
    'name': 'chicken farm',
    'icon': const  CircleAvatar(
      radius: 35,
      backgroundColor: Colors.blueAccent,
      child: Icon(
        Icons.add_chart_rounded,
        size: 35,color: Colors.white,
      ),
    ),
    'startDate':'12 April 2020',
    'count':'5000 EG',
  },
  {
    'name': 'phone company',
    'icon': const  CircleAvatar(
      radius: 35,
      backgroundColor: Colors.blueAccent,
      child: Icon(
        Icons.school_outlined,
        size: 35,color: Colors.white,
      ),
    ),
    'startDate':'12 April 2020',
    'count':'15000 EG',
  },

];