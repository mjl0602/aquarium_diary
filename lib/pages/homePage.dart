import 'package:aquarium_diary/pages/forms/aquariumFormPage.dart';
import 'package:aquarium_diary/style/text.dart';
import 'package:aquarium_diary/tools/eazyPush.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: StText.medium('临时主页')),
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              AquariumFormPage().pushAsPage(context);
            },
            child: StText.medium('创建鱼缸'),
          ),
        ],
      ),
    );
  }
}
