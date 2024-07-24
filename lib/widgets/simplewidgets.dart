import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskpro_admin/consts.dart';
import 'package:taskpro_admin/controllers/providercontroller.dart';
import 'package:taskpro_admin/widgets/bilderwidget.dart';

class Textwidget extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double fontsise;
  final Color color;
  final TextAlign textAlign;
  const Textwidget({
    required this.text,
    this.textAlign = TextAlign.center,
    this.fontWeight = FontWeight.normal,
    this.fontsise = 14,
    this.color = Colors.black,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign,
      text,
      style:
          TextStyle(fontSize: fontsise, fontWeight: fontWeight, color: color),
    );
  }
}

class Gradientcontainer extends StatelessWidget {
  final Widget widget;
  final List<Color> colors;
  final Alignment begin;
  final Alignment end;
  final List<BoxShadow> boxShadow;
  final double borderval;
  final double height;
  final double borderwidth;
  final Animation<Color?>? colorAnimation;
  const Gradientcontainer(
      {required this.widget,
      required this.colors,
      required this.begin,
      required this.end,
      this.borderwidth = 2,
      this.boxShadow = const [],
      this.borderval = 0,
      this.colorAnimation,
      this.height = double.infinity,
      super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: colorAnimation ?? const AlwaysStoppedAnimation<Color?>(null),
      builder: (context, child) {
        return Container(
            height: height,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(
                    color: colorAnimation?.value ?? Colors.transparent,
                    width: borderwidth),
                gradient:
                    LinearGradient(colors: colors, begin: begin, end: end),
                boxShadow: boxShadow,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(borderval),
                    bottomRight: Radius.circular(borderval))),
            child: widget);
      },
    );
  }
}

class Customeanimatedcontainer extends StatelessWidget {
  const Customeanimatedcontainer(
      {super.key,
      required this.width,
      this.height = 80,
      this.borderRadius,
      this.child,
      this.color = Colors.transparent});
  final double width;
  final double height;
  final Color color;
  final BorderRadius? borderRadius;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(seconds: 2),
        curve: Curves.fastLinearToSlowEaseIn,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius ?? BorderRadius.circular(0),
        ),
        alignment: Alignment.center,
        child: child ?? const SizedBox());
  }
}

class Aadharcontainer extends StatelessWidget {
  const Aadharcontainer({
    super.key,
    required this.aadaharurl,
  });

  final String aadaharurl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            barrierColor: Colors.black.withOpacity(0.8),
            context: context,
            builder: (context) => GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Scaffold(
                    backgroundColor: Colors.transparent,
                    body: Center(
                        child: GestureDetector(
                            onTap: () {},
                            child: SizedBox(
                                child: InteractiveViewer(
                                    minScale: 0.1,
                                    maxScale: 4.0,
                                    child: Image.network(aadaharurl))))))));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 6,
              offset: const Offset(1, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: SizedBox(
            height: 150,
            width: 150,
            child: Image(
              fit: BoxFit.cover,
              image: NetworkImage(aadaharurl),
            ),
          ),
        ),
      ),
    );
  }
}

class Verifybutton extends StatelessWidget {
  final String text;
  final String workerid;
  final String status;

  const Verifybutton({
    super.key,
    required this.text,
    required this.workerid,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await context.read<Appstate>().verifyandupdate(workerid, status);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Got $text'),
            ],
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: primarycolour,
        ));
        Navigator.pop(context);
      },
      style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll<Color>(primarycolour)),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

class Tabviewresult extends StatelessWidget {
  final String result;
  final String msg;
  const Tabviewresult({
    super.key,
    required this.result,
    required this.msg,
  });

  @override
  Widget build(BuildContext context) {
    return FetchdataStreambuilder(
        colorAnimation: null, messg: msg, statusvariable: result);
  }
}
