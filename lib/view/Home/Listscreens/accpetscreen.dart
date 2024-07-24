import 'package:flutter/material.dart';
import 'package:taskpro_admin/consts.dart';
import 'package:taskpro_admin/widgets/simplewidgets.dart';

class Accpetscreen extends StatefulWidget {
  const Accpetscreen({super.key});

  @override
  State<Accpetscreen> createState() => _AccpetscreenState();
}

class _AccpetscreenState extends State<Accpetscreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Gradientcontainer(
            colors: maingradient,
            begin: mainBegin,
            end: mainEnd,
            widget: DefaultTabController(
                length: 2,
                child: Gradientcontainer(
                    colors: maingradient,
                    begin: mainBegin,
                    end: mainEnd,
                    widget: Scaffold(
                        backgroundColor: Colors.transparent,
                        appBar: PreferredSize(
                            preferredSize: const Size(100, 70),
                            child: AppBar(
                                backgroundColor: Colors.transparent,
                                bottom: const TabBar(
                                    labelColor: Colors.white,
                                    unselectedLabelColor: Colors.grey,
                                    tabs: [
                                      Tab(text: 'Approved'),
                                      Tab(text: 'Rejected')
                                    ]))),
                        body: const Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: TabBarView(children: [
                              Tabviewresult(
                                  result: 'Accepted',
                                  msg: 'No Accepted Workers'),
                              Tabviewresult(
                                  result: 'Rejected',
                                  msg: 'No Rejected Workers')
                            ])))))));
  }
}
