// 来源：https://book.flutterchina.club/chapter3/input_and_form.html
//
// 功能：演示 Flutter 中输入框和表单的用法
//   - 3.5.1 TextField：登录输入框布局、获取输入内容(controller)、监听文本变化、
//     控制焦点(FocusNode/FocusScopeNode)、监听焦点状态、自定义样式
//   - 3.5.2 Form表单：Form/FormField/FormState 的使用、表单校验与提交

import 'package:flutter/material.dart';

class InputAndFormRoute extends StatefulWidget {
  const InputAndFormRoute({super.key});

  @override
  State<InputAndFormRoute> createState() => _InputAndFormRouteState();
}

class _InputAndFormRouteState extends State<InputAndFormRoute> {
  final TextEditingController _unameController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final TextEditingController _selectionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _unameController.addListener(() {
      debugPrint('controller 监听: ${_unameController.text}');
    });
    _selectionController.text = 'hello world!';
    _selectionController.selection = TextSelection(
      baseOffset: 2,
      extentOffset: _selectionController.text.length,
    );
  }

  @override
  void dispose() {
    _unameController.dispose();
    _pwdController.dispose();
    _selectionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3.5 输入框及表单')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ========== 3.5.1 TextField ==========
            _sectionTitle('3.5.1 TextField - 登录输入框布局'),
            TextField(
              autofocus: true,
              controller: _unameController,
              decoration: const InputDecoration(
                labelText: '用户名',
                hintText: '用户名或邮箱',
                prefixIcon: Icon(Icons.person),
              ),
              onChanged: (v) {
                debugPrint('onChanged: $v');
              },
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: const InputDecoration(
                labelText: '密码',
                hintText: '您的登录密码',
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),

            const SizedBox(height: 16),

            _sectionTitle('selectionController 设置默认值并选中'),
            TextField(controller: _selectionController),

            const SizedBox(height: 24),

            // ========== 焦点控制 ==========
            _sectionTitle('控制焦点 (FocusNode)'),
            const _FocusTestWidget(),

            const SizedBox(height: 24),

            // ========== 自定义样式 ==========
            _sectionTitle('自定义样式 - enabledBorder / focusedBorder'),
            TextField(
              decoration: InputDecoration(
                labelText: '请输入用户名',
                prefixIcon: const Icon(Icons.person),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),

            const SizedBox(height: 16),

            _sectionTitle('自定义样式 - Container 隐藏下划线'),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade200, width: 1.0),
                ),
              ),
              child: const TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: '电子邮件地址',
                  prefixIcon: Icon(Icons.email),
                  border: InputBorder.none,
                ),
              ),
            ),

            const SizedBox(height: 24),

            // ========== 3.5.2 Form 表单 ==========
            _sectionTitle('3.5.2 Form 表单校验'),
            Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    autofocus: true,
                    decoration: const InputDecoration(
                      labelText: '用户名',
                      hintText: '用户名或邮箱',
                      icon: Icon(Icons.person),
                    ),
                    validator: (v) {
                      return v != null && v.trim().isNotEmpty
                          ? null
                          : '用户名不能为空';
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: '密码',
                      hintText: '您的登录密码',
                      icon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                    validator: (v) {
                      return v != null && v.trim().length > 5
                          ? null
                          : '密码不能少于6位';
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('校验通过')),
                                );
                              }
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text('登录'),
                            ),
                          ),
                        ),
                      ],
                    ),
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

void main() => runApp(const MaterialApp(home: InputAndFormRoute()));

class _FocusTestWidget extends StatefulWidget {
  const _FocusTestWidget();

  @override
  _FocusTestWidgetState createState() => _FocusTestWidgetState();
}

class _FocusTestWidgetState extends State<_FocusTestWidget> {
  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  FocusScopeNode? focusScopeNode;

  @override
  void dispose() {
    focusNode1.dispose();
    focusNode2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          autofocus: true,
          focusNode: focusNode1,
          decoration: const InputDecoration(labelText: 'input1'),
        ),
        TextField(
          focusNode: focusNode2,
          decoration: const InputDecoration(labelText: 'input2'),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                focusScopeNode ??= FocusScope.of(context);
                focusScopeNode!.requestFocus(focusNode2);
              },
              child: const Text('移动焦点'),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {
                focusNode1.unfocus();
                focusNode2.unfocus();
              },
              child: const Text('隐藏键盘'),
            ),
          ],
        ),
      ],
    );
  }
}
