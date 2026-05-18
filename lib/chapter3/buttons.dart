// 来源：https://book.flutterchina.club/chapter3/buttons.html
//
// 功能：演示 Flutter Material 组件库中的按钮用法
//   - 3.2.1 ElevatedButton：漂浮按钮，带阴影和灰色背景
//   - 3.2.2 TextButton：文本按钮，默认背景透明
//   - 3.2.3 OutlinedButton：边框按钮，带边框不带阴影
//   - 3.2.4 IconButton：图标按钮
//   - 3.2.5 带图标的按钮：ElevatedButton.icon / OutlinedButton.icon / TextButton.icon

import 'package:flutter/material.dart';

class ButtonsRoute extends StatelessWidget {
  const ButtonsRoute({super.key});

  void _onPressed() {
    debugPrint('按钮被点击');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3.2 按钮')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ========== 3.2.1 ElevatedButton ==========
            _sectionTitle('3.2.1 ElevatedButton 漂浮按钮'),
            ElevatedButton(onPressed: _onPressed, child: const Text('normal')),

            const SizedBox(height: 16),

            // ========== 3.2.2 TextButton ==========
            _sectionTitle('3.2.2 TextButton 文本按钮'),
            TextButton(onPressed: _onPressed, child: const Text('normal')),

            const SizedBox(height: 16),

            // ========== 3.2.3 OutlinedButton ==========
            _sectionTitle('3.2.3 OutlinedButton 边框按钮'),
            OutlinedButton(onPressed: _onPressed, child: const Text('normal')),

            const SizedBox(height: 16),

            // ========== 3.2.4 IconButton ==========
            _sectionTitle('3.2.4 IconButton 图标按钮'),
            IconButton(icon: const Icon(Icons.thumb_up), onPressed: _onPressed),

            const SizedBox(height: 16),

            // ========== 3.2.5 带图标的按钮 ==========
            _sectionTitle('3.2.5 带图标的按钮'),
            ElevatedButton.icon(
              onPressed: _onPressed,
              icon: const Icon(Icons.send),
              label: const Text('发送'),
            ),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: _onPressed,
              icon: const Icon(Icons.add),
              label: const Text('添加'),
            ),
            const SizedBox(height: 8),
            TextButton.icon(
              onPressed: _onPressed,
              icon: const Icon(Icons.info),
              label: const Text('详情'),
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

void main() => runApp(const MaterialApp(home: ButtonsRoute()));
