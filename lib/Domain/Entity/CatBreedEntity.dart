class CatBreedEntity {
  final String id;
  final String name;
  final String description;
  final String origin;
  final String lifeSpan;
  final List<String> temperament;
  final String? referenceImageId;
  final int adaptability;
  final int affectionLevel;
  final int childFriendly;
  final int dogFriendly;
  final int energyLevel;
  final int grooming;
  final int healthIssues;
  final int intelligence;
  final int sheddingLevel;
  final int socialNeeds;
  final int strangerFriendly;
  final int vocalisation;
  final bool experimental;
  final bool hairless;
  final bool natural;
  final bool rare;
  final bool rex;
  final bool suppressedTail;
  final bool shortLegs;
  final bool hypoallergenic;
  final String? altNames;
  final String countryCode;
  late String? image;


  CatBreedEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.origin,
    required this.lifeSpan,
    required this.temperament,
    this.referenceImageId,
    required this.adaptability,
    required this.affectionLevel,
    required this.childFriendly,
    required this.dogFriendly,
    required this.energyLevel,
    required this.grooming,
    required this.healthIssues,
    required this.intelligence,
    required this.sheddingLevel,
    required this.socialNeeds,
    required this.strangerFriendly,
    required this.vocalisation,
    required this.experimental,
    required this.hairless,
    required this.natural,
    required this.rare,
    required this.rex,
    required this.suppressedTail,
    required this.shortLegs,
    required this.hypoallergenic,
    this.altNames,
    required this.countryCode,
    this.image
  });

  factory CatBreedEntity.fromJson(Map<String, dynamic> json) {
    return CatBreedEntity(
      id: json['id'] as String? ?? "",
      name: json['name'] as String? ?? "",
      description: json['description'] as String? ?? "",
      origin: json['origin'] as String? ?? "",
      lifeSpan: json['life_span'] as String? ?? "",
      temperament:
          json['temperament'] != null
              ? (json['temperament'] as String)
                  .split(',')
                  .map((item) => item.trim())
                  .toList()
                  .cast<String>()
              : [],
      referenceImageId: json['reference_image_id'] as String?,
      adaptability: json['adaptability'] as int? ?? 0,
      affectionLevel: json['affection_level'] as int? ?? 0,
      childFriendly: json['child_friendly'] as int? ?? 0,
      dogFriendly: json['dog_friendly'] as int? ?? 0,
      energyLevel: json['energy_level'] as int? ?? 0,
      grooming: json['grooming'] as int? ?? 0,
      healthIssues: json['health_issues'] as int? ?? 0,
      intelligence: json['intelligence'] as int? ?? 0,
      sheddingLevel: json['shedding_level'] as int? ?? 0,
      socialNeeds: json['social_needs'] as int? ?? 0,
      strangerFriendly: json['stranger_friendly'] as int? ?? 0,
      vocalisation: json['vocalisation'] as int? ?? 0,
      experimental: json['experimental'] == 1, // Convertir de 0/1 a bool
      hairless: json['hairless'] == 1,
      natural: json['natural'] == 1,
      rare: json['rare'] == 1,
      rex: json['rex'] == 1,
      suppressedTail: json['suppressed_tail'] == 1,
      shortLegs: json['short_legs'] == 1,
      hypoallergenic: json['hypoallergenic'] == 1,
      altNames: json['alt_names'] as String?,
      countryCode: json['country_code'] as String? ?? "",
    );
  }

   factory CatBreedEntity.fromJsonHive(Map<String, dynamic> json) {
    return CatBreedEntity(
      id: json['id'] as String? ?? "",
      name: json['name'] as String? ?? "",
      description: json['description'] as String? ?? "",
      origin: json['origin'] as String? ?? "",
      lifeSpan: json['life_span'] as String? ?? "",
      temperament:
          json['temperament'] != null
              ? (json['temperament'] as String)
                  .split(',')
                  .map((item) => item.trim())
                  .toList()
                  .cast<String>()
              : [],
      referenceImageId: json['reference_image_id'] as String?,
      adaptability: json['adaptability'] as int? ?? 0,
      affectionLevel: json['affection_level'] as int? ?? 0,
      childFriendly: json['child_friendly'] as int? ?? 0,
      dogFriendly: json['dog_friendly'] as int? ?? 0,
      energyLevel: json['energy_level'] as int? ?? 0,
      grooming: json['grooming'] as int? ?? 0,
      healthIssues: json['health_issues'] as int? ?? 0,
      intelligence: json['intelligence'] as int? ?? 0,
      sheddingLevel: json['shedding_level'] as int? ?? 0,
      socialNeeds: json['social_needs'] as int? ?? 0,
      strangerFriendly: json['stranger_friendly'] as int? ?? 0,
      vocalisation: json['vocalisation'] as int? ?? 0,
      experimental: json['experimental'] == 1, // Convertir de 0/1 a bool
      hairless: json['hairless'] == 1,
      natural: json['natural'] == 1,
      rare: json['rare'] == 1,
      rex: json['rex'] == 1,
      suppressedTail: json['suppressed_tail'] == 1,
      shortLegs: json['short_legs'] == 1,
      hypoallergenic: json['hypoallergenic'] == 1,
      altNames: json['alt_names'] as String? ?? "",
      countryCode: json['country_code'] as String? ?? "",
      image: json['image'] as String?,
    );
  }

  static List<CatBreedEntity> tolistCatBreeds(dynamic jsonList) {
    List<CatBreedEntity> catBreeds = [];
    if (jsonList is List) {
      for (var catBreed in jsonList) {
        catBreeds.add(CatBreedEntity.fromJson(catBreed));
      }
    }

    return catBreeds;
  }

   static List<CatBreedEntity> tolistCatBreedsHive(dynamic jsonList) {
    List<CatBreedEntity> catBreeds = [];
    if (jsonList is List) {
      for (var catBreed in jsonList) {
        catBreeds.add(CatBreedEntity.fromJsonHive(catBreed));
      }
    }

    return catBreeds;
  }

  Map<String, dynamic> toJson() {
  return {
    'id': id,
    'name': name,
    'description': description,
    'origin': origin,
    'life_span': lifeSpan,
    'temperament': temperament.join(', '),
    'reference_image_id': referenceImageId,
    'adaptability': adaptability,
    'affection_level': affectionLevel,
    'child_friendly': childFriendly,
    'dog_friendly': dogFriendly,
    'energy_level': energyLevel,
    'grooming': grooming,
    'health_issues': healthIssues,
    'intelligence': intelligence,
    'shedding_level': sheddingLevel,
    'social_needs': socialNeeds,
    'stranger_friendly': strangerFriendly,
    'vocalisation': vocalisation,
    'experimental': experimental ? 1 : 0,
    'hairless': hairless ? 1 : 0,
    'natural': natural ? 1 : 0,
    'rare': rare ? 1 : 0,
    'rex': rex ? 1 : 0,
    'suppressed_tail': suppressedTail ? 1 : 0,
    'short_legs': shortLegs ? 1 : 0,
    'hypoallergenic': hypoallergenic ? 1 : 0,
    'alt_names': altNames,
    'country_code': countryCode,
    'image': image,

  };
}
}
