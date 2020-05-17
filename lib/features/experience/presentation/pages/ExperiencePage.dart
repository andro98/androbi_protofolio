import 'package:androbi/features/experience/presentation/bloc/bloc.dart';
import 'package:androbi/features/experience/presentation/widgets/ExperienceDisplay.dart';
import 'package:androbi/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExperiencePage extends StatefulWidget {
  @override
  _ExperiencePageState createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {
  ExperienceBloc bl;

  @override
  void initState() {
    bl = sl<ExperienceBloc>();
    bl.add(GetExperiences());
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
      child: BlocBuilder<ExperienceBloc, ExperienceState>(builder: (context, state) {
        if (state is Loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is Loaded) {
          return ExperienceDisplay(state.experiences);
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
