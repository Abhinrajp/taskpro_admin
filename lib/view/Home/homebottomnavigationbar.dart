import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:taskpro_admin/controllers/providercontroller.dart';
import 'package:taskpro_admin/consts.dart';
import 'package:taskpro_admin/view/Home/Listscreens/accpetscreen.dart';
import 'package:taskpro_admin/view/Home/History/historyscreen.dart';
import 'package:taskpro_admin/view/Home/homescreen.dart';
import 'package:taskpro_admin/widgets/simplewidgets.dart';

class Homebottomnavigationbar extends StatefulWidget {
  const Homebottomnavigationbar({super.key});

  @override
  State<Homebottomnavigationbar> createState() =>
      _HomebottomnavigationbarState();
}

class _HomebottomnavigationbarState extends State<Homebottomnavigationbar>
    with SingleTickerProviderStateMixin {
  // late AnimationController controller;
  // late Animation<Color?> colorAnimation;
  // @override
  // void initState() {
  //   super.initState();
  //   controller = AnimationController(
  //     duration: const Duration(seconds: 2),
  //     vsync: this,
  //   )..repeat(reverse: true);
  //   colorAnimation =
  //       ColorTween(begin: const Color(0xFFFFD700), end: Colors.grey)
  //           .animate(controller);
  // }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    var appstate = Provider.of<Appstate>(context);
    double displaywidth = MediaQuery.of(context).size.width;
    return Gradientcontainer(
        colors: maingradient,
        begin: mainBegin,
        end: mainEnd,
        widget: Scaffold(
            backgroundColor: Colors.white,
            body: IndexedStack(
              index: appstate.currentindex,
              children: const [Homescreen(), Accpetscreen(), Historyscreen()],
            ),
            bottomNavigationBar: Container(
                margin: EdgeInsets.all(displaywidth * .05),
                height: displaywidth * .155,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(.1),
                          blurRadius: 30,
                          offset: const Offset(0, 10))
                    ],
                    borderRadius: BorderRadius.circular(50)),
                child: ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    padding:
                        EdgeInsets.symmetric(horizontal: displaywidth * .02),
                    itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          appstate.setcurrentindex(index);
                          HapticFeedback.lightImpact();
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Stack(children: [
                          Customeanimatedcontainer(
                              width: index == appstate.currentindex
                                  ? displaywidth * 0.42
                                  : displaywidth * 0.18,
                              child: AnimatedContainer(
                                  duration: const Duration(seconds: 2),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  height: index == appstate.currentindex
                                      ? displaywidth * 0.13
                                      : 0,
                                  width: index == appstate.currentindex
                                      ? displaywidth * 0.42
                                      : 0,
                                  decoration: BoxDecoration(
                                      color: index == appstate.currentindex
                                          ? primarycolour
                                          : Colors.transparent,
                                      borderRadius:
                                          BorderRadius.circular(50)))),
                          Customeanimatedcontainer(
                              width: index == appstate.currentindex
                                  ? displaywidth * 0.43
                                  : displaywidth * 0.22,
                              child: Stack(children: [
                                Row(children: [
                                  Customeanimatedcontainer(
                                      width: index == appstate.currentindex
                                          ? displaywidth * 0.10
                                          : 0),
                                  AnimatedOpacity(
                                      opacity: index == appstate.currentindex
                                          ? 1
                                          : 0,
                                      duration: const Duration(seconds: 2),
                                      curve: Curves.fastLinearToSlowEaseIn,
                                      child: Text(
                                          index == appstate.currentindex
                                              ? listofstring[index]
                                              : '',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15)))
                                ]),
                                Row(children: [
                                  Customeanimatedcontainer(
                                      width: index == appstate.currentindex
                                          ? displaywidth * 0.3
                                          : 20),
                                  Icon(listoficon[index],
                                      size: displaywidth * 0.076,
                                      color: index == appstate.currentindex
                                          ? Colors.white
                                          : Colors.black)
                                ])
                              ]))
                        ]))))));
  }

  List<String> listofstring = ['Home', 'Lists', 'History'];
  List<IconData> listoficon = [
    Icons.home_rounded,
    Icons.list_alt_outlined,
    Icons.history_rounded
  ];
}
