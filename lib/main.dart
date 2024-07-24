import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskpro_admin/consts.dart';
import 'package:taskpro_admin/controllers/providercontroller.dart';
import 'package:taskpro_admin/view/onboard/onboardscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Appstate(),
        )
      ],
      child: MaterialApp(
        title: 'takpro_admin',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: primarycolour),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const Onboardscreen(),
      ),
    );
  }
}
