import 'package:androbi/features/tutorials/presentation/bloc/bloc.dart';
import 'package:androbi/features/tutorials/presentation/widgets/tutorials_display.dart';
import 'package:androbi/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TutorialPage extends StatefulWidget {
  @override
  _TutorialPageState createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  TutorialBloc bl;

  @override
  void initState() {
    bl = sl<TutorialBloc>();
    bl.add(GetTutorials());
    super.initState();
  }

  @override
  void dispose() {
    bl.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => bl,
      child:
          BlocBuilder<TutorialBloc, TutorialState>(builder: (context, state) {
        if (state is Loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is Loaded) {
          return TutorialsDisplay(tutorials: state.tutorials);
        } else if (state is Error) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
