import 'package:json_annotation/json_annotation.dart';

part 'plant_image_response.g.dart';

// Example data from Pl@ntNet: https://my.plantnet.org/account/doc#
@JsonSerializable()
class PlantImageResponse {
  final List<PlantResults> results;

  PlantImageResponse({
    required this.results,
  });

  factory PlantImageResponse.fromJson(Map<String, dynamic> json) => _$PlantImageResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PlantImageResponseToJson(this);
}

@JsonSerializable()
class PlantResults {
  final PlantSpecies species;

  PlantResults({
    required this.species,
  });

  factory PlantResults.fromJson(Map<String, dynamic> json) => _$PlantResultsFromJson(json);
  Map<String, dynamic> toJson() => _$PlantResultsToJson(this);
}

@JsonSerializable()
class PlantSpecies {
  final PlantGenus genus;

  PlantSpecies({
    required this.genus,
  });

  factory PlantSpecies.fromJson(Map<String, dynamic> json) => _$PlantSpeciesFromJson(json);
  Map<String, dynamic> toJson() => _$PlantSpeciesToJson(this);
}

@JsonSerializable()
class PlantGenus {
  final String scientificNameWithoutAuthor;

  PlantGenus({
    required this.scientificNameWithoutAuthor,
  });

  factory PlantGenus.fromJson(Map<String, dynamic> json) => _$PlantGenusFromJson(json);
  Map<String, dynamic> toJson() => _$PlantGenusToJson(this);
}
