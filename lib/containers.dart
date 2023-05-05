import 'package:duasection/customtabar.dart';
import 'package:duasection/customwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class mainpage extends StatelessWidget {
  const mainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Test')),
        body: ListView(
          children: const [
            Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: CustomTabBar(),
            ),
            CustomVerticalCardList(
              data: [
                {
                  'image': 'assets/1.PNG',
                  'text': 'Rabbana',
                  'screen': 'duasection',
                },
                {
                  'image': 'assets/2.PNG',
                  'text': 'Prayers',
                  'screen': 'MusicPlayer',
                },
                {
                  'image': 'assets/3.PNG',
                  'text': 'Something',
                  'screen': 'test3',
                },
                {
                  'image': 'assets/4.PNG',
                  'text': 'Misc',
                },
                {
                  'image': 'assets/5.png',
                  'text': 'Ruqya & Illness',
                },
                {
                  'image': 'assets/1.PNG',
                  'text': 'Morning',
                },
                {
                  'image': 'assets/2.PNG',
                  'text': 'Evening',
                },
                {
                  'image': 'assets/3.PNG',
                  'text': 'Before Sleep',
                },
                {
                  'image': 'assets/4.PNG',
                  'text': 'Salah',
                },
                {
                  'image': 'assets/5.png',
                  'text': 'After Salah',
                },
                {
                  'image': 'assets/5.png',
                  'text': 'Sunnah Duas',
                },
                {
                  'image': 'assets/5.png',
                  'text': 'Salawat',
                },
                {
                  'image': 'assets/1.PNG',
                  'text': 'Names of Allah',
                },
              ],
              multipleCardsInRows: [3, 5, 6, 7],
            ),
          ],
        ));
  }
}
