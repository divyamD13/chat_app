import 'package:chat_app/screens/auth_screen.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/screens/connection_wait_screen.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlutterChat',
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 44, 177, 17),
        ),
      ),
      home: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(),
       builder:(context,snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return ConnectionWaitScreen();
        }
        if(snapshot.hasData){
          return  ChatScreen();
        }
        return AuthScreen();
       }),
    );
  }
}
