import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_cat/features/core/constants/api.dart';
import 'package:random_cat/features/random_cat/data/providers/random_cat_provider.dart';
import 'package:random_cat/features/random_cat/domain/usecases/get_random_cat.dart';

import '../../../../injection_container.dart';
import '../../domain/entities/random_cat.dart';
import '../bloc/random_cat_bloc.dart';
import '../widgets/widgets.dart';

class RandomCatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Cat'),
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

class RandomCatWidget extends StatelessWidget {
  const RandomCatWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        BlocBuilder<RandomCatBloc, RandomCatState>(
          builder: (context, state) {
            if (state is Empty) {
              return MessageDisplay(
                message: 'No cat in here!!',
              );
            } else if (state is Loading) {
              return LoadingWidget();
            } else if (state is Error) {
              return MessageDisplay(
                message: state.message,
              );
            } else if (state is Loaded) {
              return RandomCatDisplay(
                cat: state.randomCat,
              );
            }
          },
        ),
        RaisedButton(
          child: Text('Show Random Cat'),
          onPressed: () {
            BlocProvider.of<RandomCatBloc>(context).add(
              GetRandomCatEvent(),
            );
          },
        ),
      ],
    );
  }
}
