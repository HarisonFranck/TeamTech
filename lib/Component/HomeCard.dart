import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final double? containerWidth;
  final String typeCard;
  final String value;
  final double pourcent;
  final String state;
  final Icon cardIcon;
  final Color cardContainerIconColor;
  final Color? cardColor;

  HomeCard(
      {this.containerWidth,
      required this.typeCard,
      required this.value,
      required this.pourcent,
      required this.state,
      required this.cardIcon,
      required this.cardContainerIconColor,
      this.cardColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (containerWidth != null) ? containerWidth : 220,
      height: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6), color: Colors.white),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 30, top: 10),
            child: Text(
              typeCard,
              style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w500,
                  fontSize: 13),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            children: [
              Text(
                value,
                style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 17,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                '+${pourcent.toString()}%',
                style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 13,
                    color: Colors.teal,
                    fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  decoration: BoxDecoration(color: cardContainerIconColor),
                  width: 30,
                  height: 30,
                  child: cardIcon,
                ),
              ),
              const SizedBox(
                width: 30,
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              bottom: 10,
              top: 10,
              right: (containerWidth != null && containerWidth! >= 1600)
                  ? 120
                  : 40),
          child: Text(
            state,
            style: TextStyle(
                overflow: TextOverflow.ellipsis,
                letterSpacing: 2,
                fontSize: 13,
                color: Colors.black.withOpacity(0.4)),
          ),
        )
      ]),
    );
  }
}
