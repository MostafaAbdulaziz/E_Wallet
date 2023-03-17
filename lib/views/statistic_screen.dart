import 'package:ewallet/utils/Lists.dart';
import 'package:ewallet/views/widgets.dart';
import 'package:flutter/material.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({Key? key}) : super(key: key);

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
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                            image: AssetImage('assets/images/statistic.jpg'),
                            fit: BoxFit.fill
                        ),
                      boxShadow: const [
                        BoxShadow(color: Colors.black,offset: Offset(7,7))
                      ]
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => allStatistic(index),
                    itemCount: allDataStatistic.length,
                  ),
                  const SizedBox(height: 20,),
                  materButton(function: (){}, text: 'buy shares')
                ],
              ),
            ),
          ),
        ),

      ),

    );
  }
}

Widget allStatistic(int index) => Container(
    margin: const EdgeInsets.symmetric(vertical: 5),
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      boxShadow: const [
        BoxShadow(blurRadius: 18, color: Colors.black, offset: Offset(-15, 15)),
      ],
      gradient: const LinearGradient(
        colors: [Colors.black, Colors.grey],
        begin: Alignment.bottomCenter,
        end: Alignment.topRight,
      ),
      border: Border.all(color: Colors.black, width: 0.7),
    ),
    child: ListTile(
      leading: allDataStatistic[index]['icon'],
      title: Text(
        allDataStatistic[index]['name'],
        style: const TextStyle(fontSize: 15, color: Colors.white),
      ),
      subtitle: Text(
        allDataStatistic[index]['startDate'],
        style: const TextStyle(color: Colors.white, fontSize: 10),
      ),
      trailing: textOfApp(text: allDataStatistic[index]['count'], font: 18,color: Colors.white),
    ));