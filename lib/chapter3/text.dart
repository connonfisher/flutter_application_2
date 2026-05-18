// 来源：https://book.flutterchina.club/chapter3/text.html
//
// 功能：演示 Flutter 中文本及样式的各种用法
//   - 3.1.1 Text：基础文本显示，textAlign、maxLines、overflow、textScaler
//   - 3.1.2 TextStyle：文本样式，color、fontSize、height、fontFamily、decoration 等
//   - 3.1.3 TextSpan：富文本片段，不同部分使用不同样式
//   - 3.1.4 DefaultTextStyle：默认文本样式继承
//   - 3.1.5 字体：使用自定义字体（需在 pubspec.yaml 中配置）

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextRoute extends StatelessWidget {
  const TextRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3.1 文本及样式')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ========== 3.1.1 Text ==========
            _sectionTitle('3.1.1 Text 基础用法'),
            const Text('Hello world', textAlign: TextAlign.left),
            const SizedBox(height: 8),
            Text(
              'Hello world! I\'m Jack. ' * 4,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            const Text('Hello world', textScaler: TextScaler.linear(1.5)),
            const SizedBox(height: 8),
            Text('Hello world ' * 6, textAlign: TextAlign.center),

            const SizedBox(height: 24),

            // ========== 3.1.2 TextStyle ==========
            _sectionTitle('3.1.2 TextStyle 样式'),
            Text(
              'Hello world',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18.0,
                height: 1.2,
                fontFamily: 'Courier',
                background: Paint()..color = Colors.yellow,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dashed,
              ),
            ),

            const SizedBox(height: 24),

            // ========== 3.1.3 TextSpan ==========
            _sectionTitle('3.1.3 TextSpan 富文本'),
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(text: 'Home: '),
                  TextSpan(
                    text: 'https://flutterchina.club',
                    style: const TextStyle(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        debugPrint('链接被点击');
                      },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ========== 3.1.4 DefaultTextStyle ==========
            _sectionTitle('3.1.4 DefaultTextStyle 默认样式继承'),
            DefaultTextStyle(
              style: const TextStyle(color: Colors.red, fontSize: 20.0),
              textAlign: TextAlign.start,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('hello world'),
                  Text('I am Jack'),
                  Text(
                    'I am Jack',
                    style: TextStyle(inherit: false, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}

void main() => runApp(const MaterialApp(home: TextRoute()));
