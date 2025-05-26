import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:s_rock_initial_round/views/music_home_screen.dart';
import 'view_model/music_services_view_model.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
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
          create: (_) => MusicServicesViewModel()..fetchServices(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Music Services',
        theme: ThemeData.dark(),
        home: const MusicHomeScreen(),
      ),
    );
  }
}
