// 来源：https://book.flutterchina.club/chapter3/img_and_icon.html
//
// 功能：演示 Flutter 中图片和 Icon 的用法
//   - 3.3.1 图片：Image 的 asset、网络加载、fit 缩放模式、colorBlendMode 混合、
//     repeat 重复模式、ImageProvider
//   - 3.3.2 Icon：Material Design 字体图标、自定义字体图标的基本概念

import 'package:flutter/material.dart';

class ImageAndIconRoute extends StatelessWidget {
  const ImageAndIconRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3.3 图片及ICON')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ========== 3.3.1 图片 ==========
            _sectionTitle('3.3.1 图片 - 网络图片'),
            Image.network(
              'https://avatars2.githubusercontent.com/u/20411648?s=460&v=4',
              width: 100.0,
            ),
            const SizedBox(height: 8),
            Image(
              image: const NetworkImage(
                'https://avatars2.githubusercontent.com/u/20411648?s=460&v=4',
              ),
              width: 100.0,
            ),

            const SizedBox(height: 16),

            _sectionTitle('Image fit 缩放模式'),
            const _FitExample(),

            const SizedBox(height: 16),

            _sectionTitle('colorBlendMode 颜色混合'),
            Image.network(
              'https://avatars2.githubusercontent.com/u/20411648?s=460&v=4',
              width: 100.0,
              color: Colors.blue,
              colorBlendMode: BlendMode.difference,
            ),

            const SizedBox(height: 16),

            _sectionTitle('repeat 重复模式'),
            Image.network(
              'https://avatars2.githubusercontent.com/u/20411648?s=460&v=4',
              width: 100.0,
              height: 200.0,
              repeat: ImageRepeat.repeatY,
            ),

            const SizedBox(height: 24),

            // ========== 3.3.2 ICON ==========
            _sectionTitle('3.3.2 Material Design 字体图标'),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.accessible, color: Colors.green),
                Icon(Icons.error, color: Colors.green),
                Icon(Icons.fingerprint, color: Colors.green),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              '\uE03e \uE237 \uE287',
              style: TextStyle(
                fontFamily: 'MaterialIcons',
                fontSize: 24.0,
                color: Colors.green,
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

void main() => runApp(const MaterialApp(home: ImageAndIconRoute()));

class _FitExample extends StatelessWidget {
  const _FitExample();

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          <BoxFit>[
                BoxFit.fill,
                BoxFit.contain,
                BoxFit.cover,
                BoxFit.fitWidth,
                BoxFit.fitHeight,
                BoxFit.scaleDown,
                BoxFit.none,
              ]
              .map(
                (fit) => Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 100,
                        height: 50,
                        child: Image.network(
                          'https://avatars2.githubusercontent.com/u/20411648?s=460&v=4',
                          fit: fit,
                        ),
                      ),
                    ),
                    Text(fit.toString()),
                  ],
                ),
              )
              .toList(),
    );
  }
}
