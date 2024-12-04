// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IngredientImpl _$$IngredientImplFromJson(Map<String, dynamic> json) =>
    _$IngredientImpl(
      name: json['name'] as String,
      category: json['category'] as String,
      diet: (json['diet'] as List<dynamic>).map((e) => e as String).toList(),
      availability: json['availability'] as String,
      season:
          (json['season'] as List<dynamic>).map((e) => e as String).toList(),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$IngredientImplToJson(_$IngredientImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'category': instance.category,
      'diet': instance.diet,
      'availability': instance.availability,
      'season': instance.season,
      'notes': instance.notes,
    };
