import 'package:flutter/material.dart';
import 'package:taskpro_admin/consts.dart';

class Onboardscreensecond extends StatelessWidget {
  const Onboardscreensecond({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 120, left: 140),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'taskpro',
                  style: TextStyle(
                      color: primarycolour, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 80),
                  child: Text('skip >', style: TextStyle(fontSize: 11)),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            ' Accept or reject the worker based on  ',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const Text(
            'the verification',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          Image.asset('lib/assets/onboard-second.png'),
        ],
      ),
    );
  }
}
