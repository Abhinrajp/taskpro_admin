import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:taskpro_admin/widgets/simplewidgets.dart';

class Profilescreen extends StatelessWidget {
  final Map<String, dynamic> workerData;
  const Profilescreen({required this.workerData, super.key});

  @override
  Widget build(BuildContext context) {
    log(workerData['registerd']);
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(.7),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back))),
            )),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
            child: Column(children: [
          Stack(children: [
            Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.transparent)),
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                height: 500,
                width: double.infinity,
                child: Image(
                    image: NetworkImage(workerData['profileImageUrl']),
                    fit: BoxFit.cover)),
            Positioned.fill(
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                              Colors.transparent,
                              Theme.of(context).scaffoldBackgroundColor,
                            ])))))
          ]),
          const SizedBox(height: 40),
          Textwidget(
              text: workerData['firstName'] + ' ' + workerData['lastName'],
              fontWeight: FontWeight.bold,
              fontsise: 45),
          const SizedBox(height: 5),
          Textwidget(
              text: workerData['workType'],
              fontWeight: FontWeight.bold,
              fontsise: 33),
          const SizedBox(height: 20),
          Textwidget(
              text: workerData['email'], color: Colors.black54, fontsise: 33),
          const SizedBox(height: 10),
          Textwidget(
              text: workerData['phoneNumber'],
              color: Colors.black54,
              fontsise: 33),
          const SizedBox(height: 10),
          Textwidget(
              text: workerData['maxQualification'],
              color: Colors.black54,
              fontsise: 33),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Textwidget(
                text: workerData['location'],
                color: Colors.black54,
                fontsise: 33),
          ),
          const SizedBox(height: 40),
          const Textwidget(
              text: 'About', fontWeight: FontWeight.bold, fontsise: 33),
          const SizedBox(height: 20),
          SizedBox(
              width: 560,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Textwidget(
                    text: workerData['about'],
                    textAlign: TextAlign.left,
                    color: Colors.black54,
                    fontsise: 33),
              )),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Aadharcontainer(aadaharurl: workerData['aadharFrontUrl']),
              Aadharcontainer(aadaharurl: workerData['aadharBackUrl']),
            ],
          ),
          const SizedBox(height: 40),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Verifybutton(
                text: 'Accept', status: 'Accepted', workerid: workerData['id']),
            Verifybutton(
                text: 'Reject', status: 'Rejected', workerid: workerData['id'])
          ]),
          const SizedBox(height: 40)
        ])));
  }
}
