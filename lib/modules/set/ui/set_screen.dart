import 'package:flutter/material.dart';
import 'package:quiz_app/modules/set/ui/widgets/set_holder.dart';

class SetScreen extends StatelessWidget {
  const SetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Set Screen'
          ),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return SetHolder();
          },
          itemCount: 10,
        ),
      ),
    );
  }
}
