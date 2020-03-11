import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_cat/features/random_cat/domain/entities/random_cat.dart';

import '../../../../injection_container.dart';
import '../bloc/random_cat_bloc.dart';

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
        child: Column(
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
                  return DisplayRandomCat(
                    cat: state.randomCat.fileUrl as RandomCat,
                  );
                }
              },
            ),
            RaisedButton(
              child: Text('Show Random Cat'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class MessageDisplay extends StatelessWidget {
  final String message;

  const MessageDisplay({
    Key key,
    @required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      child: Center(
        child: Text(
          message,
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class DisplayRandomCat extends StatelessWidget {
  final RandomCat cat;

  const DisplayRandomCat({
    Key key,
    @required this.cat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      child: Center(
        child: Image.network(
          cat.fileUrl,
        ),
      ),
    );
  }
}
