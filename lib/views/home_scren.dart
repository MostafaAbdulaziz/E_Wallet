import 'package:ewallet/utils/Lists.dart';
import 'package:ewallet/views/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: decorOfBackground(),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration:  BoxDecoration(
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
                    border: Border.all(color: Colors.black,width: 0.5,)
                ),
                child: Column(
                  children: [
                    textOfApp(
                        text: 'your Balance: 1000 EG',
                        font: 20,
                        color: Colors.white),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: materButton(function: () {
                              Navigator.of(context).pushNamed('pushScreen');
                            }, text: 'withdraw')),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                            child:
                                materButton(function: () {
                                  Navigator.of(context).pushNamed('cardScreen');
                                }, text: 'Charge')),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2/1.5,
                  crossAxisCount: 2,
                  children: List.generate(
                      dataOfGridItems.length, (index) => itemOfGridview(index)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget itemOfGridview(int index) => Container(
  decoration:  BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      boxShadow: const [
        BoxShadow(
            blurRadius: 18, color: Colors.black, offset: Offset(0, 10)),
      ],
      gradient: const LinearGradient(
        colors: [Colors.black, Colors.grey],
        begin: Alignment.bottomCenter,
        end: Alignment.topRight,
      ),
    border: Border.all(color: Colors.black,width: 0.5),
  ),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CircleAvatar(
        radius: 33,
        backgroundImage: AssetImage(dataOfGridItems[index]['image']),
      ),
      const SizedBox(
        height: 10,
      ),
      textOfApp(
          text: dataOfGridItems[index]['text'],
          font: 16,
          color: Colors.white,
      )
    ],
  ),
);
