import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/modules/home/ui/widgets/quiz_model_card.dart';
import 'package:quiz_app/modules/home/ui/widgets/topic_slider_container.dart';

import '../bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // void handleFirebaseMessage() async {
  //   RemoteMessage? message =
  //       await FirebaseMessaging.instance.getInitialMessage();

  //   if (message != null) {
  //     _showProgress();
  //     Contract? c =
  //         await AppState.instance.searchAddress(message.data['address']);
  //     _dismissprogress();
  //     if (c != null) {
  //       navigatorKey.currentState?.push(
  //           MaterialPageRoute(builder: (context) => ContractExplore(c: c)));
  //     }
  //   }

  //   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
  //     _showProgress();
  //     Contract? c =
  //         await AppState.instance.searchAddress(message.data['address']);
  //     _dismissprogress();
  //     if (c != null) {
  //       navigatorKey.currentState?.push(
  //           MaterialPageRoute(builder: (context) => ContractExplore(c: c)));
  //       fetchAndParse();
  //       fetchData();
  //     }
  //   });
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("GK Quiz"),
        ),
        drawer: Drawer(
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          child: ListView(
            children: const [
              DrawerHeader(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [FlutterLogo(), Text("GK Quiz")])),
              ListTile(title: Text("Rate Us on PlayStore")),
              ListTile(title: Text("Share")),
              ListTile(title: Text("Write email")),
              ListTile(title: Text("Terms & Conditions")),
            ],
          ),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is HomeErrorState) {
              return Center(
                child: Text(state.message),
              );
            } else if (state is HomeFetchedState) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    QuizCard(
                      quizModel: state.quizModel,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TopicSliderContainer(dataModel: state.examModel),
                    const SizedBox(
                      height: 10,
                    ),
                    TopicSliderContainer(
                      dataModel: state.stateModel,
                      useHorizontalView: true,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TopicSliderContainer(
                      dataModel: state.practiceModel,
                      useHorizontalView: true,
                    ),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
