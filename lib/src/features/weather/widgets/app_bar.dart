import 'package:flutter/material.dart';

class WeatherAppBar extends StatelessWidget {
  const WeatherAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 208,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context); // Use Navigator.pop to go back
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 18),
                  child: Text(
                    "H2O Smart",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ),
          NotificationIconCustom(onTap: () {}),
        ],
      ),
    );
  }
}

class NotificationIconCustom extends StatelessWidget {
  const NotificationIconCustom(
      {super.key, required this.onTap, this.height, this.width});
  final void Function() onTap;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "Unit1",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        GestureDetector(
          onTap: onTap,
          child: Image.asset(
            'assets/icons/arrow-down-sign-to-navigate.png',
            height: height ?? 16,
            width: width ?? 16,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
