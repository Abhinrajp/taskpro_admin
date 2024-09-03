import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskpro_admin/consts.dart';
import 'package:taskpro_admin/controllers/providercontroller.dart';
import 'package:taskpro_admin/view/Home/homebottomnavigationbar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyDlZWznVrt30eFPdDBkWB96p5VSpiqPoOo',
          appId: '1:303514847232:android:688d42fd02ca3c798330e5',
          messagingSenderId: '',
          projectId: 'taskpro-a4d5c'));
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
        home: const Homebottomnavigationbar(),
      ),
    );
  }
}
