import 'package:flutter/material.dart';

import '../../domain/entities/random_cat.dart';

class RandomCatSerializer extends RandomCat {
  RandomCatSerializer({
    @required String fileUrl,
  }) : super(fileUrl: fileUrl);

  factory RandomCatSerializer.fromJson(Map<String, dynamic> data) {
    return RandomCatSerializer(
      fileUrl: data['file'],
    );
  }
}
