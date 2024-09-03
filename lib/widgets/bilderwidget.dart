import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:taskpro_admin/view/Home/profile/profilescreen.dart';
import 'package:taskpro_admin/widgets/cardwidgets.dart';
import 'package:taskpro_admin/widgets/simplewidgets.dart';

class FetchdataStreambuilder extends StatelessWidget {
  final String messg;
  final String statusvariable;
  final Animation<Color?>? colorAnimation;

  const FetchdataStreambuilder({
    super.key,
    required this.messg,
    required this.statusvariable,
    this.colorAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('workers').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            log('connection waiting');
            return const ShimmerCardformainlistview();
          } else if (snapshot.connectionState == ConnectionState.active &&
              snapshot.hasData) {
            log('connection actived');
            var newworkers = snapshot.data!.docs
                .where((doc) => doc['registerd'] == statusvariable)
                .toList();
            if (newworkers.isEmpty) {
              log('connection actived but empty');

              return Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    SizedBox(
                        height: 250,
                        child: Image.asset('lib/assets/no-data.png')),
                    Textwidget(
                        text: messg, fontWeight: FontWeight.bold, fontsise: 11),
                  ]));
            }

            return ListView.builder(
              itemCount: newworkers.length,
              itemBuilder: (context, index) {
                var workerData = newworkers[index].data();
                var name =
                    '${workerData['firstName']} ${workerData['lastName']}';
                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Profilescreen(workerData: workerData)));
                        },
                        child: statusvariable == 'registerd'
                            ? Cardformainlistview(
                                colorAnimation: colorAnimation!,
                                workerData: workerData,
                                name: name)
                            : Cardforresultlistview(
                                statuschek: workerData['registerd'],
                                wokerdata: workerData)));
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            log('no data still loading');

            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
