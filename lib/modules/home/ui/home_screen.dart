import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/modules/home/ui/widgets/quiz_model_card.dart';
import 'package:quiz_app/modules/home/ui/widgets/topic_slider_container.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          child: DrawerView(),
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

class DrawerView extends StatelessWidget {
  const DrawerView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state is HomeLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is HomeErrorState) {
        return Center(
          child: Text(state.message),
        );
      } else if (state is HomeFetchedState) {
        return ListView(
          children: [
            DrawerHeader(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [FlutterLogo(), Text("GK Quiz")])),
            ListTile(
              title: Text("Rate Us on PlayStore"),
              onTap: () {
                final url = state.linksData.findWithLinkName("rate us");
                launchUrl(Uri.parse(url.linkUrl!));
              },
            ),
            if (state.linksData.isLinkPresent("more apps"))
              ListTile(
                title: Text("More Apps"),
                onTap: () {
                  final url = state.linksData.findWithLinkName("more apps");
                  launchUrl(Uri.parse(url.linkUrl!));
                },
              ),
            ListTile(
              title: Text("Share"),
              onTap: () {
                Share.share(
                    'Checkout the Quiz app on Play Store: <link of app>.');
              },
            ),
            if (state.linksData.isLinkPresent("email"))
              ListTile(
                title: Text("Write email"),
                onTap: () {
                  final url = state.linksData.findWithLinkName("email");
                  launchUrl(Uri.parse("mailto:${url.linkUrl}"));
                },
              ),
            if (state.linksData.isLinkPresent("terms"))
              ListTile(
                title: Text("Terms & Conditions"),
                onTap: () {
                  final url = state.linksData.findWithLinkName("terms");
                  launchUrl(Uri.parse(url.linkUrl!));
                },
              ),
          ],
        );
      }
      return const SizedBox.shrink();
    });
  }
}
