import 'package:flutter/material.dart';

class CurrentStatusCard extends StatefulWidget {
  const CurrentStatusCard({super.key});

  @override
  State<CurrentStatusCard> createState() => _CurrentStatusCardState();
}

class _CurrentStatusCardState extends State<CurrentStatusCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.lightBlue[50],
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        // border: Border.all(color: Colors.black12)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Image.asset(
                "assets/img/motor.jpg",
                fit: BoxFit.fill,
                height: 50,
                width: 50,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "மோட்டார் 1 இயங்குகிறது",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Start time: ",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey[900]),
                            ),
                            const TextSpan(
                              text: "4:00 pm ",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "End time: ",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey[900]),
                            ),
                            const TextSpan(
                              text: "5:00 pm ",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
