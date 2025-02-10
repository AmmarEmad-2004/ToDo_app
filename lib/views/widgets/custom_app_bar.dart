import 'package:flutter/material.dart';
import 'package:to_do_app/constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/DOOIT.png', width: 60),
                Image.asset('assets/Group.png', width: 35),
              ],
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Center(
            child: Container(
              height: 50,
              width: 145,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
              ),
              child: Center(
                child: Container(
                  height: 47,
                  width: 142,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: kPrimaryColor,
                  ),
                  child: Center(
                    child: Text(
                      text,
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
