// 来源：https://book.flutterchina.club/chapter3/radio_and_checkbox.html
//
// 功能：演示 Flutter Material 组件库中的单选开关和复选框
//   - 3.4.1 Switch：Material 风格的单选开关，状态由父组件管理
//   - 3.4.2 Checkbox：复选框，支持 activeColor 自定义、tristate 三态
//   - 3.4.3 注意事项：Switch 和 Checkbox 不自行维护状态，需要父组件管理

import 'package:flutter/material.dart';

class SwitchAndCheckBoxTestRoute extends StatefulWidget {
  const SwitchAndCheckBoxTestRoute({super.key});

  @override
  State<SwitchAndCheckBoxTestRoute> createState() =>
      _SwitchAndCheckBoxTestRouteState();
}

class _SwitchAndCheckBoxTestRouteState
    extends State<SwitchAndCheckBoxTestRoute> {
  bool _switchSelected = true;
  bool _checkboxSelected = true;
  bool? _tristateValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3.4 单选开关和复选框')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _sectionTitle('3.4.1 Switch 单选开关'),
            Row(
              children: [
                const Text('Switch: '),
                Switch(
                  value: _switchSelected,
                  onChanged: (value) {
                    setState(() {
                      _switchSelected = value;
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 16),

            _sectionTitle('3.4.2 Checkbox 复选框'),
            Row(
              children: [
                const Text('Checkbox (红色): '),
                Checkbox(
                  value: _checkboxSelected,
                  activeColor: Colors.red,
                  onChanged: (value) {
                    setState(() {
                      _checkboxSelected = value!;
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 8),

            // 三态 Checkbox
            Row(
              children: [
                const Text('Checkbox (三态): '),
                Checkbox(
                  tristate: true,
                  value: _tristateValue,
                  onChanged: (value) {
                    setState(() {
                      _tristateValue = value;
                    });
                  },
                ),
              ],
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

void main() => runApp(const MaterialApp(home: SwitchAndCheckBoxTestRoute()));
