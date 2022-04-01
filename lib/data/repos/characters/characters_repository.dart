import 'package:elementary_test_app/data/api/client.dart';
import 'package:elementary_test_app/data/characters/disney_character_model.dart';
import 'package:mocktail/mocktail.dart';

class CharactersRepository {
  final RestClient _client;

  CharactersRepository(this._client);

  //* Получение списка персонажей
  Future<List<DisneyCharacterModel>> getAllCharacters() =>
      _client.getCharacters().then(
            (value) => (value.data as List<dynamic>)
                .map((dynamic e) =>
                    DisneyCharacterModel.fromJson(e as Map<String, dynamic>))
                .toList(),
          );
}

class CharactersRepositoryMock extends Mock implements CharactersRepository {}
