import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              ((context, i) => DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          height: 100,
                          width: 100,
                        ),
                        Text(
                          '$i data',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  )),
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
