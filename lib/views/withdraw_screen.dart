import 'package:ewallet/utils/Lists.dart';
import 'package:ewallet/utils/functions.dart';
import 'package:ewallet/views/widgets.dart';
import 'package:flutter/material.dart';

class WithdrawScreen extends StatelessWidget {
  const WithdrawScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          padding: const EdgeInsets.only(top: 15),
          decoration: decorOfBackground(),
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => itemOfListview(index, context),
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
            itemCount: dataOfChargeItems.length,
          ),
        ),
      ),
    );
  }
}

Widget itemOfListview(int index, context) {
  return GestureDetector(
    onTap: (){
      onTapChargeType(context,index);
    },
    child: Container(
      width: double.infinity,
      height: 90,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      padding: const EdgeInsets.only(left: 10),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                blurRadius: 18, color: Colors.black, offset: Offset(10, 10)),
          ],
          gradient: LinearGradient(
            colors: [Colors.black, Colors.grey],
            begin: Alignment.bottomCenter,
            end: Alignment.topRight,
          )),
      child: Row(
        children: [
          CircleAvatar(
            radius: 33,
            backgroundImage: AssetImage(dataOfChargeItems[index]['image']),
          ),
          const SizedBox(
            width: 10,
          ),
          textOfApp(
              text: dataOfChargeItems[index]['text'],
              font: 16,
              color: Colors.white)
        ],
      ),
    ),
  );
}
