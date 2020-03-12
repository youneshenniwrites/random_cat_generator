import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/random_cat_bloc.dart';
import 'widgets.dart';

class RandomCatWidget extends StatelessWidget {
  const RandomCatWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        BlocBuilder<RandomCatBloc, RandomCatState>(
          builder: (_, state) {
            if (state is Empty) {
              return const MessageDisplay(
                message: 'No cat in here!!',
              );
            } else if (state is Loading) {
              return const LoadingWidget();
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
          child: const Text('Show Random Cat'),
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
