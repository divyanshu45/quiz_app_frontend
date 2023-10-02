import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/modules/home/ui/widgets/quiz_card.dart';

import '../bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if(state is HomeLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if(state is HomeErrorState) {
              return Center(
                child: Text(
                  state.message
                ),
              );
            } else if(state is HomeFetchedState) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    QuizCard(isFirst: true, allQuizModel: state.allQuizModel,),
                    SizedBox(height: 10,),
                    QuizCard(isFirst: false, allQuizModel: state.allQuizModel),
                    SizedBox(height: 10,),
                    QuizCard(isFirst: true, allQuizModel: state.allQuizModel,)
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
