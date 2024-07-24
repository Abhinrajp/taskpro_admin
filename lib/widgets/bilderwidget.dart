import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:taskpro_admin/view/Home/profile/profilescreen.dart';
import 'package:taskpro_admin/widgets/cardwidgets.dart';
import 'package:taskpro_admin/widgets/simplewidgets.dart';

class FetchdataStreambuilder extends StatelessWidget {
  final String messg;
  final String statusvariable;
  const FetchdataStreambuilder({
    super.key,
    this.colorAnimation,
    required this.messg,
    required this.statusvariable,
  });

  final Animation<Color?>? colorAnimation;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('workers').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              var newworkers = snapshot.data!.docs
                  .where((doc) => doc['registerd'] == statusvariable)
                  .toList();
              if (newworkers.isEmpty) {
                return Center(
                    child: SizedBox(
                        height: 200,
                        width: 150,
                        child: Column(children: [
                          Image.asset('lib/assets/no-data.png'),
                          Textwidget(
                              text: messg,
                              fontWeight: FontWeight.bold,
                              fontsise: 11)
                        ])));
              }
              return ListView.builder(
                itemBuilder: (context, index) {
                  var workerData = newworkers[index].data();
                  var name =
                      workerData['firstName'] + ' ' + workerData['lastName'];
                  return Padding(
                      padding: const EdgeInsets.only(
                          right: 8, top: 2, bottom: 2, left: 8),
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
                itemCount: newworkers.length,
              );
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.hasError.toString()));
            } else {
              return Center(
                  child: Column(children: [
                Textwidget(
                  text: messg,
                  fontWeight: FontWeight.bold,
                  fontsise: 18,
                ),
                Image.asset('lib/assets/no-data.png')
              ]));
            }
          } else {
            return ListView.builder(
              itemBuilder: (_, __) => const Padding(
                padding: EdgeInsets.only(right: 8, top: 2, bottom: 2, left: 8),
                child: ShimmerCardforresultlistview(),
              ),
              itemCount: 20,
            );
          }
        });
  }
}
