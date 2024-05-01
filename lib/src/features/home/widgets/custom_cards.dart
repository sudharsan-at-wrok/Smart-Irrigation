import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final String cardName;
  final String imgPath;
  const CustomCard({
    super.key,
    required this.cardName,
    required this.imgPath,
  });

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100,
      // width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white70),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.lightBlue[50],
              ),
              child: Image.asset(
                widget.imgPath,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.cardName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
