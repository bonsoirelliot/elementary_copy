class DisneyCharacterModel {
  final int id;
  final String name;
  final String? imageUrl;

  DisneyCharacterModel({
    required this.id,
    required this.name,
    this.imageUrl,
  });

  factory DisneyCharacterModel.fromJson(Map<String, dynamic> map) {
    try {
      return DisneyCharacterModel(
        id: map['_id'] as int,
        name: map['name'] as String,
        imageUrl: map['imageUrl'] as String?,
      );
    } catch (e) {
      throw Exception('DisneyCharacterModel: $e');
    }
  }
}
