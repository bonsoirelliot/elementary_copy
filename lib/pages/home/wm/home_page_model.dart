import 'package:elementary/elementary.dart';
import 'package:elementary_test_app/data/characters/disney_character_model.dart';
import 'package:elementary_test_app/data/repos/characters/characters_repository.dart';

//* Все запросы и изменения состояния происходят тут, ВМ слушает изменения
class HomePageModel extends ElementaryModel {
  final characters = EntityStateNotifier<List<DisneyCharacterModel>>();
  final CharactersRepository charactersRepository;

  Future<void> getCharacters() async {
    final previousData = characters.value?.data;
    characters.loading();
    try {
      characters.content(await charactersRepository.getAllCharacters());
    } catch (e) {
      handleError(e);
      e as Exception;
      characters.error(e, previousData);
    }
  }

  HomePageModel({
    required this.charactersRepository,
    ErrorHandler? errorHandler,
  }) : super(errorHandler: errorHandler);
}
