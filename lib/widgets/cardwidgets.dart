import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:taskpro_admin/consts.dart';
import 'package:taskpro_admin/widgets/simplewidgets.dart';

class Cardforresultlistview extends StatelessWidget {
  const Cardforresultlistview({
    super.key,
    required this.wokerdata,
    required this.statuschek,
  });
  final String statuschek;
  final Map<String, dynamic> wokerdata;

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: const RoundedRectangleBorder(),
        color: Colors.white.withOpacity(.5),
        elevation: 0,
        child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5))
              ],
            ),
            height: 100,
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              barcontainer(statuschek),
              const SizedBox(width: 11),
              CircleAvatar(
                  maxRadius: 40,
                  backgroundImage: NetworkImage(wokerdata['profileImageUrl'])),
              Padding(
                  padding: const EdgeInsets.only(
                      right: 8, top: 8, bottom: 8, left: 15),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Textwidget(
                            text: wokerdata['firstName'] +
                                ' ' +
                                wokerdata['lastName'],
                            fontWeight: FontWeight.bold,
                            fontsise: 15),
                        Textwidget(
                            text: wokerdata['workType'], color: Colors.black87),
                        Textwidget(
                            text: wokerdata['phoneNumber'],
                            color: Colors.black87)
                      ]))
            ])));
  }
}

Widget barcontainer(String statuscheck) {
  if (statuscheck == 'Accepted') {
    return Container(color: Colors.green.withOpacity(.7), width: 10);
  } else if (statuscheck == 'Rejected') {
    return Container(color: Colors.red, width: 10);
  } else {
    return Container(color: Colors.grey[700], width: 10);
  }
}

class Cardformainlistview extends StatelessWidget {
  const Cardformainlistview({
    super.key,
    required this.colorAnimation,
    required this.workerData,
    required this.name,
  });

  final Animation<Color?> colorAnimation;
  final Map<String, dynamic> workerData;
  final name;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.transparent,
        elevation: 0,
        child: Gradientcontainer(
            colors: listviewgradien,
            begin: listBegin,
            end: listEnd,
            borderval: 40,
            colorAnimation: colorAnimation,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5))
            ],
            height: 100,
            widget:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              const SizedBox(width: 11),
              CircleAvatar(
                  maxRadius: 40,
                  backgroundImage: NetworkImage(workerData['profileImageUrl'])),
              Padding(
                  padding: const EdgeInsets.only(
                      right: 8, top: 8, bottom: 8, left: 15),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Textwidget(
                            text: name,
                            fontWeight: FontWeight.bold,
                            fontsise: 15),
                        Textwidget(
                            text: workerData['workType'],
                            color: Colors.black54),
                        Textwidget(
                            text: workerData['phoneNumber'],
                            color: Colors.black54)
                      ]))
            ])));
  }
}

class ShimmerCardformainlistview extends StatelessWidget {
  const ShimmerCardformainlistview({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.grey[300]!, Colors.grey[100]!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          height: 100,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 11),
              CircleAvatar(
                maxRadius: 40,
                backgroundColor: Colors.grey[300],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 8,
                  top: 8,
                  bottom: 8,
                  left: 15,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 150,
                      height: 15,
                      color: Colors.grey[300],
                    ),
                    const SizedBox(height: 5),
                    Container(
                      width: 100,
                      height: 15,
                      color: Colors.grey[300],
                    ),
                    const SizedBox(height: 5),
                    Container(
                      width: 100,
                      height: 15,
                      color: Colors.grey[300],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShimmerCardforresultlistview extends StatelessWidget {
  const ShimmerCardforresultlistview({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: const RoundedRectangleBorder(),
        color: Colors.white.withOpacity(.5),
        elevation: 0,
        child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5))
            ]),
            height: 100,
            child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(width: 20, color: Colors.grey[300]),
                      const SizedBox(width: 11),
                      CircleAvatar(
                          maxRadius: 40, backgroundColor: Colors.grey[300]),
                      Padding(
                          padding: const EdgeInsets.only(
                              right: 8, top: 8, bottom: 8, left: 15),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 150,
                                  height: 15,
                                  color: Colors.grey[300],
                                ),
                                const SizedBox(height: 5),
                                Container(
                                  width: 100,
                                  height: 15,
                                  color: Colors.grey[300],
                                ),
                                const SizedBox(height: 5),
                                Container(
                                  width: 100,
                                  height: 15,
                                  color: Colors.grey[300],
                                )
                              ]))
                    ]))));
  }
}
