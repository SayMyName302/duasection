import 'package:flutter/material.dart';

class CustomVerticalCardList extends StatelessWidget {
  final List<Map<String, dynamic>> data;
  final List<int> multipleCardsInRows;

  const CustomVerticalCardList({
    Key? key,
    required this.data,
    this.multipleCardsInRows = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _buildCardRows(context),
      ),
    );
  }

  List<Widget> _buildCardRows(BuildContext context) {
    final List<Widget> rows = [];

    int index = 0;
    while (index < data.length) {
      final int cardsInRow = multipleCardsInRows.contains(rows.length) ? 2 : 1;
      final List<Widget> rowChildren = [];

      for (int j = 0; j < cardsInRow && index < data.length; j++) {
        final Map<String, dynamic> cardData = data[index];

        final Widget card = GestureDetector(
          onTap: () {
            // Navigate to the desired screen when the card is tapped
            Navigator.pushNamed(context, cardData['screen']);
          },
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              margin: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                image: DecorationImage(
                  image: AssetImage(cardData['image']),
                  fit: BoxFit.cover,
                ),
              ),
              height: 150.0,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    cardData['text'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );

        rowChildren.add(Expanded(child: card));
        index++;
      }

      rows.add(Row(children: rowChildren));
    }

    return rows;
  }
}
