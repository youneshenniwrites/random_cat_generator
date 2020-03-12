import 'package:flutter/material.dart';

import '../../domain/entities/random_cat.dart';

class RandomCatDisplay extends StatelessWidget {
  final RandomCat cat;

  const RandomCatDisplay({
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
