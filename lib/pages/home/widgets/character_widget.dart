import 'package:elementary_test_app/data/characters/disney_character_model.dart';
import 'package:flutter/material.dart';

class CharacterWidget extends StatelessWidget {
  final DisneyCharacterModel model;
  const CharacterWidget({
    required this.model,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.blueGrey,
      ),
      margin: const EdgeInsets.only(
        bottom: 5,
        right: 20,
        left: 20,
      ),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Text(
              model.name,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: 80,
            width: 80,
            child: ClipRRect(
              child: model.imageUrl != null
                  ? Image.network(
                      model.imageUrl!,
                      fit: BoxFit.cover,
                    )
                  : Image.asset('assets/images/banana.jpg'),
              borderRadius: BorderRadius.circular(90),
            ),
          ),
        ],
      ),
    );
  }
}
