import 'package:androbi/features/profile/presentation/bloc/bloc.dart';
import 'package:androbi/features/profile/presentation/widgets/app_bar.dart';
import 'package:androbi/features/profile/presentation/widgets/profile_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProfileBloc bl;

  @override
  void initState() {
    bl = sl<ProfileBloc>();
    bl.add(GetProfile());
    super.initState();
  }

  @override
  void dispose() {
    bl.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/img/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: buildBody(context),
        ),
      ),
    );
  }

  BlocProvider<ProfileBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => bl,
      child: BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
        if (state is Loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is Loaded) {
          return Center(
              child: ProfileDisplay(
            profile: state.profile,
          ));
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
