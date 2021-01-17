import 'package:json_annotation/json_annotation.dart';
import 'package:star_wars_flutter/api/models/swapi_character.dart';
import 'package:star_wars_flutter/api/models/swapi_movie.dart';

part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse <T> implements JsonConverterGenerics {

  BaseResponse({this.message, this.result});

  final String message;


  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);


  @JsonKey(fromJson: dataFromJson, toJson: dataToJson)
  final T result;

}

T dataFromJson<T>(dynamic input) {
  final Map<String, dynamic> castedInput = input as Map<String, dynamic>;
  if (castedInput == null || castedInput.isEmpty) {
    return null;
  }
  if (T == SwapiCharacter) {
    return SwapiCharacter.fromJson(castedInput) as T;
  }
  if (T == SwapiMovie) {
    return SwapiMovie.fromJson(castedInput) as T;
  }

  throw Exception(
      'Unknown type, please ensure that you have added a conversion for data from json above');
}


dynamic dataToJson<T>(dynamic input) {
  if (input == null) {
    return null;
  }
  if (input is List) {
    final List<dynamic> value =
    input.map<dynamic>((dynamic e) => dataToJson<dynamic>(e)).toList();
    return value;
  }
  return (input as JsonConverterGenerics).toJson();
}

abstract class JsonConverterGenerics {
  Map<String, dynamic> toJson();
}
