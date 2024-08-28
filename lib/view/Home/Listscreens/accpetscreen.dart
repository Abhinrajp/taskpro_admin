import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
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
                    widget: SafeArea(
                        child: Scaffold(
                            backgroundColor: Colors.transparent,
                            body: Stack(children: [
                              Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: SegmentedTabControl(
                                      indicatorDecoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50))),
                                      tabs: [
                                        SegmentTab(
                                            backgroundColor: Colors.transparent,
                                            label: 'Accepted',
                                            color:
                                                Colors.green.withOpacity(.7)),
                                        SegmentTab(
                                            backgroundColor: Colors.transparent,
                                            label: 'Rejected',
                                            color: Colors.red.withOpacity(.7)),
                                      ])),
                              const Padding(
                                  padding: EdgeInsets.only(top: 70),
                                  child: TabBarView(children: [
                                    Tabviewresult(
                                        result: 'Accepted',
                                        msg: 'No Accepted Workers'),
                                    Tabviewresult(
                                        result: 'Rejected',
                                        msg: 'No Rejected Workers')
                                  ]))
                            ])))))));
  }
}
