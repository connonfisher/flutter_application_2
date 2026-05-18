// 来源：https://book.flutterchina.club/chapter3/
//
// 功能：Flutter 基础组件演示 —— 将第3章全部小节集成在一起，
//       每个小节可独立导航到对应的演示页面。
//       各小节文件也包含独立的 main() 入口，可单独运行。

import 'package:flutter/material.dart';

import 'chapter3/text.dart';
import 'chapter3/buttons.dart';
import 'chapter3/img_and_icon.dart';
import 'chapter3/radio_and_checkbox.dart';
import 'chapter3/input_and_form.dart';
import 'chapter3/progress.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 基础组件',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter 基础组件演示'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildCard(
            context,
            '3.1 文本及样式',
            'https://book.flutterchina.club/chapter3/text.html',
            'Text · TextStyle · TextSpan · DefaultTextStyle',
            const TextRoute(),
          ),
          _buildCard(
            context,
            '3.2 按钮',
            'https://book.flutterchina.club/chapter3/buttons.html',
            'ElevatedButton · TextButton · OutlinedButton · IconButton',
            const ButtonsRoute(),
          ),
          _buildCard(
            context,
            '3.3 图片及 ICON',
            'https://book.flutterchina.club/chapter3/img_and_icon.html',
            'Image · BoxFit · colorBlendMode · Icon',
            const ImageAndIconRoute(),
          ),
          _buildCard(
            context,
            '3.4 单选开关和复选框',
            'https://book.flutterchina.club/chapter3/radio_and_checkbox.html',
            'Switch · Checkbox · tristate',
            const SwitchAndCheckBoxTestRoute(),
          ),
          _buildCard(
            context,
            '3.5 输入框及表单',
            'https://book.flutterchina.club/chapter3/input_and_form.html',
            'TextField · FocusNode · Form · 表单校验',
            const InputAndFormRoute(),
          ),
          _buildCard(
            context,
            '3.6 进度指示器',
            'https://book.flutterchina.club/chapter3/progress.html',
            'LinearProgressIndicator · CircularProgressIndicator · 颜色动画',
            const ProgressRoute(),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(
    BuildContext context,
    String title,
    String url,
    String tags,
    Widget page,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      child: ListTile(
        title: Text(title),
        subtitle: Text(tags, style: const TextStyle(fontSize: 12)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => page),
          );
        },
      ),
    );
  }
}
