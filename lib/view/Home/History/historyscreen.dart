import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:taskpro_admin/consts.dart';
import 'package:taskpro_admin/view/Home/profile/profilescreen.dart';
import 'package:taskpro_admin/widgets/cardwidgets.dart';
import 'package:taskpro_admin/widgets/simplewidgets.dart';

class Historyscreen extends StatefulWidget {
  const Historyscreen({super.key});

  @override
  State<Historyscreen> createState() => _HistoryscreenState();
}

class _HistoryscreenState extends State<Historyscreen> {
  @override
  Widget build(BuildContext context) {
    return Gradientcontainer(
        colors: maingradient,
        begin: mainBegin,
        end: mainEnd,
        widget: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
                backgroundColor: Colors.transparent,
                title: const Textwidget(
                    text: 'History',
                    color: Colors.white,
                    fontsise: 20,
                    fontWeight: FontWeight.bold),
                centerTitle: true),
            body: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('workers')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.active) {
                        if (snapshot.hasData) {
                          var newworkers = snapshot.data!.docs;
                          return ListView.builder(
                              itemBuilder: (context, index) {
                                var workerData = newworkers[index].data();
                                return Padding(
                                    padding: const EdgeInsets.only(
                                        right: 8, top: 2, bottom: 2, left: 8),
                                    child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Profilescreen(
                                                          workerData:
                                                              workerData)));
                                        },
                                        child: Cardforresultlistview(
                                            statuschek: 'history',
                                            wokerdata: workerData)));
                              },
                              itemCount: newworkers.length);
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text(snapshot.hasError.toString()));
                        } else {
                          return Center(
                              child: Column(children: [
                            const Textwidget(
                                text: 'No Requests',
                                fontWeight: FontWeight.bold,
                                fontsise: 18),
                            Image.asset('lib/assets/no-data.png')
                          ]));
                        }
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }))));
  }
}
