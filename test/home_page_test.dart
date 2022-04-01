import 'package:elementary/elementary.dart';
import 'package:elementary_test_app/data/characters/disney_character_model.dart';
import 'package:elementary_test_app/pages/home/home_page.dart';
import 'package:elementary_test_app/pages/home/wm/home_page_wm.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  const homePage = HomePage();
  final homePageWM = HomePageWMMock();

  setUp(() {
    when(() => homePageWM.characterListState).thenAnswer(
      (_) => EntityStateNotifier<List<DisneyCharacterModel>>(),
    );
  });

  testGoldens('home page default golden test', (tester) async {
    await tester.pumpWidgetBuilder(homePage.build(homePageWM));
    await multiScreenGolden(tester, 'home_page');
  });

  testGoldens('home page with data golden test', (tester) async {
    when(() => homePageWM.characterListState).thenAnswer(
      (_) => EntityStateNotifier<List<DisneyCharacterModel>>(
          EntityState<List<DisneyCharacterModel>>(data: _charactersMock)),
    );

    await tester.pumpWidgetBuilder(homePage.build(homePageWM));
    await multiScreenGolden(tester, 'home_page_data');
  });
}

final _charactersMock = [
  DisneyCharacterModel(
    id: 0,
    // imageUrl: 'https://www.gastronom.ru/binfiles/images/20151029/bddcbbce.jpg',
    name: 'Banana',
  ),
  DisneyCharacterModel(
    id: 0,
    // imageUrl:
    //     'https://www.fizkulturaisport.ru/images/stories/food/2101-poleznye-svojstva-banana.jpg',
    name: 'Second Banana',
  ),
];
