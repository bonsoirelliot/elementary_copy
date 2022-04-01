import 'package:elementary_test_app/data/characters/disney_character_model.dart';
import 'package:elementary_test_app/data/repos/characters/characters_repository.dart';
import 'package:elementary_test_app/pages/home/wm/home_page_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  final charactersRepository = CharactersRepositoryMock();
  late HomePageModel model;

  setUp(() {
    model = HomePageModel(charactersRepository: charactersRepository);
  });

  test('init with empty list', () async {
    when(() => charactersRepository.getAllCharacters()).thenAnswer(
      (_) => Future.value([]),
    );
    expect(model.characters.value?.data, isNull);
  });

  test('getCityPrediction return empty list', () async {
    when(() => charactersRepository.getAllCharacters()).thenAnswer(
      (_) => Future.value(_charactersMock),
    );
    await model.getCharacters();
    expect(model.characters.value?.data, same(_charactersMock));
  });
}

final _charactersMock = [
  DisneyCharacterModel(
    id: 0,
    // imageUrl: 'https://www.gastronom.ru/binfiles/images/20151029/bddcbbce.jpg',
    name: 'Banana',
  ),
  DisneyCharacterModel(
    id: 1,
    // imageUrl:
    //     'https://www.fizkulturaisport.ru/images/stories/food/2101-poleznye-svojstva-banana.jpg',
    name: 'Second Banana',
  ),
];
