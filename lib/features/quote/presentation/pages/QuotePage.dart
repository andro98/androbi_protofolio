import 'package:androbi/features/quote/presentation/bloc/bloc.dart';
import 'package:androbi/features/quote/presentation/widgets/app_bar.dart';
import 'package:androbi/features/quote/presentation/widgets/quote_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';

class QuotePage extends StatefulWidget {
  @override
  _QuotePageState createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  QuoteBloc bl;

  @override
  void initState() {
    bl = sl<QuoteBloc>();
    bl.add(GetQuote());
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
      child: BlocBuilder<QuoteBloc, QuoteState>(builder: (context, state) {
        if (state is Loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is Loaded) {
          return QuoteDisplay(state.quote);
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
