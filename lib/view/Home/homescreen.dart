// import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';
import 'package:flutter/material.dart';
import 'package:taskpro_admin/consts.dart';
import 'package:taskpro_admin/widgets/bilderwidget.dart';
import 'package:taskpro_admin/widgets/simplewidgets.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Color?> colorAnimation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    colorAnimation =
        ColorTween(begin: const Color(0xFFFFD700), end: Colors.grey)
            .animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Gradientcontainer(
        colors: maingradient,
        begin: mainBegin,
        end: mainEnd,
        widget: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(children: [
              const Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Padding(
                    padding: EdgeInsets.only(top: 90, left: 15),
                    child: Textwidget(
                        text: 'Admin',
                        fontWeight: FontWeight.bold,
                        color: Colors.grey))
              ]),
              const Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Textwidget(
                        text: 'taskpro',
                        fontWeight: FontWeight.bold,
                        fontsise: 26,
                        color: Colors.white))
              ]),
              Expanded(
                  child: FetchdataStreambuilder(
                      colorAnimation: colorAnimation,
                      messg: 'No New Requests',
                      statusvariable: 'registerd'))
            ])));
  }
}
