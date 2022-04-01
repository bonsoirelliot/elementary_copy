import 'package:dio/dio.dart';
import 'package:elementary/elementary.dart';
import 'package:elementary_test_app/data/api/client.dart';
import 'package:elementary_test_app/data/characters/disney_character_model.dart';
import 'package:elementary_test_app/data/repos/characters/characters_repository.dart';
import 'package:elementary_test_app/pages/home/handlers/default_error_handler.dart';
import 'package:elementary_test_app/pages/home/home_page.dart';
import 'package:elementary_test_app/pages/home/wm/home_page_model.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';

class HomePageWM extends WidgetModel<HomePage, HomePageModel>
    implements IHomePageWM {
  HomePageWM({required HomePageModel model}) : super(model);

  //* Подписка на EntityStateNotifier,
  /// [characterListState] использую для отображения данных
  @override
  ListenableState<EntityState<List<DisneyCharacterModel>>>
      get characterListState => model.characters;

  //* Метод, вызывающийся при инициализации ВМ
  //* Что-то типа onLoad, onBind
  @override
  void initWidgetModel() {
    super.initWidgetModel();
    loadCountryList();
  }

  //* Обработка ошибок вынесена в отдельный метод
  @override
  void onErrorHandle(Object error) {
    super.onErrorHandle(error);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error: $error'),
      ),
    );
  }

  //* Тут нет VoidAction и StreamedAction, используются просто Future
  Future<void> loadCountryList() async {
    model.getCharacters();
  }
}

//* Интерфейс для вм
abstract class IHomePageWM extends IWidgetModel {
  ListenableState<EntityState<List<DisneyCharacterModel>>>
      get characterListState;
}

//* С этим еще надо разобраться
//* Не совсем понятно, как удобнее создавать вм
HomePageWM createHomePageWM(BuildContext _) => HomePageWM(
      model: HomePageModel(
        charactersRepository: CharactersRepository(RestClient(Dio())),
        errorHandler: DefaultErrorHandler(),
      ),
    );

mixin DiagnosticableToStringMixin on Object {
  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return super.toString();
  }
}

class HomePageWMMock extends Mock
    with DiagnosticableToStringMixin
    implements HomePageWM {}
