// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant_image_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlantImageResponse _$PlantImageResponseFromJson(Map<String, dynamic> json) {
  return PlantImageResponse(
    results: (json['results'] as List<dynamic>)
        .map((e) => PlantResults.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$PlantImageResponseToJson(PlantImageResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

PlantResults _$PlantResultsFromJson(Map<String, dynamic> json) {
  return PlantResults(
    species: PlantSpecies.fromJson(json['species'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PlantResultsToJson(PlantResults instance) =>
    <String, dynamic>{
      'species': instance.species,
    };

PlantSpecies _$PlantSpeciesFromJson(Map<String, dynamic> json) {
  return PlantSpecies(
    genus: PlantGenus.fromJson(json['genus'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PlantSpeciesToJson(PlantSpecies instance) =>
    <String, dynamic>{
      'genus': instance.genus,
    };

PlantGenus _$PlantGenusFromJson(Map<String, dynamic> json) {
  return PlantGenus(
    scientificNameWithoutAuthor: json['scientificNameWithoutAuthor'] as String,
  );
}

Map<String, dynamic> _$PlantGenusToJson(PlantGenus instance) =>
    <String, dynamic>{
      'scientificNameWithoutAuthor': instance.scientificNameWithoutAuthor,
    };
