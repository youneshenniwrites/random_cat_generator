import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../../core/constants/api.dart';
import '../../../core/error/exceptions.dart';
import '../serializers/random_cat_serializer.dart';

/* 
This class sits at the edge between 
the external api world and our implementation. 
It throw errors if any and send them to the 
implementation for error handling. 
*/

abstract class RandomCatProvider {
  /// Calls the https://aws.random.cat/meow endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<RandomCatSerializer> getRandomCat();
}

/* 
This class is the implementation of the RandomCatProvider Contract
*/
class CallRandomCatProvider implements RandomCatProvider {
  final http.Client client;

  CallRandomCatProvider({
    @required this.client,
  });

  @override
  Future<RandomCatSerializer> getRandomCat() async {
    final response = await client.get(
      endpoint,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      print(RandomCatSerializer.fromJson(
        json.decode(response.body),
      ));
      return RandomCatSerializer.fromJson(
        json.decode(response.body),
      );
    } else {
      throw ServerException();
    }
  }
}
