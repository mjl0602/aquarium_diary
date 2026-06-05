import 'package:aquarium_diary/pages/forms/aquarium_form_page.dart';
import 'package:aquarium_diary/style/text.dart';
import 'package:aquarium_diary/tools/eazy_push.dart';
import 'package:flutter/material.dart';

class DebugBtnsPage extends StatefulWidget {
  const DebugBtnsPage({super.key});

  @override
  State<DebugBtnsPage> createState() => _DebugBtnsPageState();
}

class _DebugBtnsPageState extends State<DebugBtnsPage> {
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
