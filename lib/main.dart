import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/modules/home/bloc/home_bloc.dart';
import 'package:quiz_app/modules/quiz/ui/quiz_screen.dart';
import 'package:quiz_app/modules/set/ui/set_screen.dart';
import 'package:quiz_app/modules/splash/ui/splash_screen.dart';
import 'package:quiz_app/modules/topic/ui/topic_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc()..add(FetchAllQuizEvent()),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashScreen()
      ),
    );
  }
}