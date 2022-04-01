import 'package:elementary/elementary.dart';
import 'package:elementary_test_app/data/characters/disney_character_model.dart';
import 'package:elementary_test_app/pages/home/widgets/character_widget.dart';
import 'package:elementary_test_app/pages/home/wm/home_page_wm.dart';
import 'package:flutter/material.dart';

class HomePage extends ElementaryWidget<HomePageWM> {
  const HomePage({
    WidgetModelFactory<HomePageWM> wmFactory = createHomePageWM,
    Key? key,
  }) : super(
          wmFactory,
          key: key,
        );

  @override
  Widget build(HomePageWM wm) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.change_circle),
        onPressed: wm.loadCountryList,
      ),
      body: SafeArea(
        child: EntityStateNotifierBuilder<List<DisneyCharacterModel>>(
          listenableEntityState: wm.characterListState,
          loadingBuilder: (context, state) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          },
          builder: (context, characters) {
            return characters != null
                ? CustomScrollView(
                    slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, i) => CharacterWidget(
                            model: characters[i],
                          ),
                          childCount: characters.length,
                        ),
                      ),
                    ],
                  )
                : const SizedBox();
          },
        ),
      ),
    );
  }
}
