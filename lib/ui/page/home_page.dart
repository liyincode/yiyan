import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_yiyan/ui/widget/vertical_text.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String textContent = '';
  String from = '';

  void loadTextContent() async {
    Uri url = Uri.parse('https://v1.hitokoto.cn?c=k');
    final response = await http.post(url);
    print(response.body.toString());
    final data = jsonDecode(response.body);
    setState(() {
      textContent = data['hitokoto'] ?? '未知的旅途中，你我擦肩而过。';
      from = data['from_who'] ?? '未知';
    });
  }

  @override
  void initState() {
    super.initState();
    loadTextContent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => loadTextContent(),
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                foregroundImage: NetworkImage(
                    'https://img.xjh.me/random_img.php?type=bg&ctype=nature&return=302'),
                radius: 90,
              ),
            ),
            VerticalText(
              content: textContent,
              author: from,
              numberOfSingleLineText: 5,
            )
          ],
        ),
      ),
    );
  }
}
