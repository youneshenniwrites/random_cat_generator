import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../bloc/random_cat_bloc.dart';
import '../widgets/random_cat_widget.dart';

class RandomCatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Cat'),
      ),
      body: buildBody(context),
    );
  }

  BlocProvider<RandomCatBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<RandomCatBloc>(),
      child: Center(
        child: RandomCatWidget(),
      ),
    );
  }
}
