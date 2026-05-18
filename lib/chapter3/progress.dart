// 来源：https://book.flutterchina.club/chapter3/progress.html
//
// 功能：演示 Flutter Material 组件库中的进度指示器
//   - 3.6.1 LinearProgressIndicator：线性进度条，模糊进度与精确进度
//   - 3.6.2 CircularProgressIndicator：圆形进度条，模糊进度与精确进度
//   - 3.6.3 自定义尺寸：通过 SizedBox 约束进度条尺寸
//   - 3.6.3 进度色动画：通过 AnimationController 实现颜色渐变动画

import 'package:flutter/material.dart';

class ProgressRoute extends StatefulWidget {
  const ProgressRoute({super.key});

  @override
  State<ProgressRoute> createState() => _ProgressRouteState();
}

class _ProgressRouteState extends State<ProgressRoute>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _animationController.forward();
    _animationController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3.6 进度指示器')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // ========== 3.6.1 LinearProgressIndicator ==========
            _sectionTitle('3.6.1 LinearProgressIndicator 线性进度条'),
            const Text('模糊进度（循环动画）:'),
            LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: const AlwaysStoppedAnimation(Colors.blue),
            ),
            const SizedBox(height: 8),
            const Text('精确进度 50%:'),
            LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: const AlwaysStoppedAnimation(Colors.blue),
              value: 0.5,
            ),

            const SizedBox(height: 24),

            // ========== 3.6.2 CircularProgressIndicator ==========
            _sectionTitle('3.6.2 CircularProgressIndicator 圆形进度条'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const Text('模糊进度'),
                    const SizedBox(height: 8),
                    CircularProgressIndicator(
                      backgroundColor: Colors.grey[200],
                      valueColor: const AlwaysStoppedAnimation(Colors.blue),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text('精确进度 50%'),
                    const SizedBox(height: 8),
                    CircularProgressIndicator(
                      backgroundColor: Colors.grey[200],
                      valueColor: const AlwaysStoppedAnimation(Colors.blue),
                      value: 0.5,
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 24),

            // ========== 3.6.3 自定义尺寸 ==========
            _sectionTitle('3.6.3 自定义尺寸'),
            const Text('线性进度条高度设为 3:'),
            SizedBox(
              height: 3,
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: const AlwaysStoppedAnimation(Colors.blue),
                value: 0.5,
              ),
            ),
            const SizedBox(height: 12),
            const Text('圆形进度条直径设为 100:'),
            const SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(
                backgroundColor: Color(0xFFEEEEEE),
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: 0.7,
              ),
            ),
            const SizedBox(height: 12),
            const Text('宽高不等时显示为椭圆:'),
            const SizedBox(
              height: 100,
              width: 130,
              child: CircularProgressIndicator(
                backgroundColor: Color(0xFFEEEEEE),
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: 0.7,
              ),
            ),

            const SizedBox(height: 24),

            // ========== 进度色动画 ==========
            _sectionTitle('进度色动画 (3秒内从灰色变为蓝色)'),
            Padding(
              padding: const EdgeInsets.all(16),
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: ColorTween(
                  begin: Colors.grey,
                  end: Colors.blue,
                ).animate(_animationController),
                value: _animationController.value,
              ),
            ),
            const SizedBox(height: 50),
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
