import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alm_quiz/authentication/controller/authentication_controller.dart';
import 'package:flutter_alm_quiz/notificaiton_service.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './authentication/authentication_view.dart';
import './wigdets/quiz_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}


class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authenticationStatus = ref.watch(authProvider);
    Widget getScreen() {
      if (authenticationStatus.status == AuthenticationStatus.authenticated) {
        return const QuizScreen();
      }
      if (authenticationStatus.status == AuthenticationStatus.unauthenticated) {
        return const AuthenticationView();
      }
      return const AuthenticationView();
    }

    return MaterialApp(
        title: 'ALM Quiz',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.yellow,
          canvasColor: const Color(0xFFFFFEF4),
          bottomSheetTheme: const BottomSheetThemeData( backgroundColor: Colors.transparent),
        ),
        // home: QuizScreen(),
        home: getScreen()
    );
  }
}

