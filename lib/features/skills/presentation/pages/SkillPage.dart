import 'package:androbi/features/skills/presentation/bloc/bloc.dart';
import 'package:androbi/features/skills/presentation/widgets/SkillDisplay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';

class SkillPage extends StatefulWidget {
  @override
  _SkillPageState createState() => _SkillPageState();
}

class _SkillPageState extends State<SkillPage> {
  SkillsBloc bl;

  @override
  void initState() {
    bl = sl<SkillsBloc>();
    bl.add(GetSkills());
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
      child: BlocBuilder<SkillsBloc, SkillsState>(builder: (context, state) {
        if (state is Loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is Loaded) {
          return SkillDisplay(state.skills);
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
