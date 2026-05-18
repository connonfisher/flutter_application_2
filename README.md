# Flutter 基础组件演示

基于 [《Flutter 实战·第二版》](https://book.flutterchina.club/) 第三章「基础组件」的学习项目，将每个小节的示例代码独立拆分，支持**单文件运行**和**统一导航**两种方式。

## 环境

- Flutter 3.41.4 · Dart 3.11.1
- 支持 Android / Windows / Web

## 快速开始

```bash
# 1. 克隆项目
git clone <your-repo-url>
cd flutter_application_2

# 2. 安装依赖
flutter pub get

# 3. 运行总目录（可导航到所有小节）
flutter run

# 4. 或单独运行某一小节（以 3.1 为例）
flutter run lib/chapter3/text.dart
```

## 项目结构

```
lib/
├── main.dart                         # 入口：章节总目录
└── chapter3/
    ├── text.dart                     # 3.1 文本及样式
    ├── buttons.dart                  # 3.2 按钮
    ├── img_and_icon.dart             # 3.3 图片及 ICON
    ├── radio_and_checkbox.dart       # 3.4 单选开关和复选框
    ├── input_and_form.dart           # 3.5 输入框及表单
    └── progress.dart                 # 3.6 进度指示器
```

> 每个小节文件末尾都包含独立的 `main()` 入口，可脱离主目录单独运行。

---

# 3.1 文本及样式

> 原文地址：[3.1 文本及样式](https://book.flutterchina.club/chapter3/text.html)

## 功能介绍

演示 Flutter 中与文本显示相关的核心组件和样式 API：

| 知识点 | 说明 |
|--------|------|
| `Text` | 基础文本，支持 `textAlign`、`maxLines`、`overflow`、`textScaler` |
| `TextStyle` | 文本样式：颜色、字号、行高、字体、下划线、背景色等 |
| `TextSpan` | 富文本片段，同一段文字内使用不同样式 |
| `DefaultTextStyle` | 子树中默认样式的继承与覆盖 |

## 演示效果

| 代码 | 运行效果 |
|:---:|:---:|
| ![代码截图](assets/演示截图/3.1%20文本及样式-代码.png) | ![运行效果](assets/演示截图/3.1%20文本及样式-运行效果.png) |

## 核心代码示例

### 基础文本 & 溢出处理

```dart
Text('Hello world', textAlign: TextAlign.left)

Text(
  "Hello world! I'm Jack. " * 4,
  maxLines: 1,
  overflow: TextOverflow.ellipsis,
)

Text('Hello world', textScaler: TextScaler.linear(1.5))
```

### TextStyle 样式

```dart
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
)
```

### TextSpan 富文本

```dart
Text.rich(
  TextSpan(
    children: [
      const TextSpan(text: 'Home: '),
      TextSpan(
        text: 'https://flutterchina.club',
        style: const TextStyle(color: Colors.blue),
        recognizer: TapGestureRecognizer()
          ..onTap = () => debugPrint('链接被点击'),
      ),
    ],
  ),
)
```

### DefaultTextStyle 样式继承

```dart
DefaultTextStyle(
  style: const TextStyle(color: Colors.red, fontSize: 20.0),
  child: Column(
    children: const [
      Text('hello world'),            // 红色 20px
      Text('I am Jack'),              // 红色 20px
      Text('I am Jack',
        style: TextStyle(inherit: false, color: Colors.grey)), // 灰色
    ],
  ),
)
```

## 独立运行

```bash
flutter run lib/chapter3/text.dart
```

或直接在 IDE 中打开该文件，运行文件内的 `main()` 即可。

---

# 3.2 按钮

> 原文地址：[3.2 按钮](https://book.flutterchina.club/chapter3/buttons.html)

## 功能介绍

演示 Flutter Material 组件库中的所有按钮类型：

| 知识点 | 说明 |
|--------|------|
| `ElevatedButton` | 漂浮按钮，默认带有阴影和灰色背景，按下时阴影变大 |
| `TextButton` | 文本按钮，默认背景透明不带阴影，按下后有背景色 |
| `OutlinedButton` | 边框按钮，默认带边框且背景透明，按下后边框变亮 |
| `IconButton` | 纯图标按钮，不包含文字，点击后出现背景 |
| 带图标的按钮 | `ElevatedButton.icon` / `TextButton.icon` / `OutlinedButton.icon` |

> 所有 Material 按钮按下时均有"水波涟漪动画"，不提供 `onPressed` 时按钮自动变为禁用态。

## 演示效果

| 代码 | 运行效果 |
|:---:|:---:|
| ![代码截图](assets/演示截图/3.2%20按钮-代码.png) | ![运行效果](assets/演示截图/3.2%20按钮-运行效果.png) |

## 核心代码示例

### ElevatedButton / TextButton / OutlinedButton

```dart
ElevatedButton(
  onPressed: () => debugPrint('按钮被点击'),
  child: const Text('normal'),
)

TextButton(
  onPressed: () => debugPrint('按钮被点击'),
  child: const Text('normal'),
)

OutlinedButton(
  onPressed: () => debugPrint('按钮被点击'),
  child: const Text('normal'),
)
```

### IconButton 图标按钮

```dart
IconButton(
  icon: const Icon(Icons.thumb_up),
  onPressed: () => debugPrint('按钮被点击'),
)
```

### 带图标的按钮

```dart
ElevatedButton.icon(
  onPressed: _onPressed,
  icon: const Icon(Icons.send),
  label: const Text('发送'),
)

OutlinedButton.icon(
  onPressed: _onPressed,
  icon: const Icon(Icons.add),
  label: const Text('添加'),
)

TextButton.icon(
  onPressed: _onPressed,
  icon: const Icon(Icons.info),
  label: const Text('详情'),
)
```

## 独立运行

```bash
flutter run lib/chapter3/buttons.dart
```

或直接在 IDE 中打开该文件，运行文件内的 `main()` 即可。

---

# 3.3 图片及 ICON

> 原文地址：[3.3 图片及 ICON](https://book.flutterchina.club/chapter3/img_and_icon.html)

## 功能介绍

演示 Flutter 中图片加载和字体图标的用法：

| 知识点 | 说明 |
|--------|------|
| `Image.network` / `NetworkImage` | 从网络加载图片，支持 `ImageProvider` 抽象 |
| `BoxFit` | 7 种缩放模式：`fill`、`cover`、`contain`、`fitWidth`、`fitHeight`、`scaleDown`、`none` |
| `colorBlendMode` | 颜色混合模式，如 `BlendMode.difference` |
| `repeat` | 图片重复模式，如 `ImageRepeat.repeatY` |
| `Icon` / `Icons` | Material Design 字体图标，矢量、可调颜色大小 |

> iconfont 优势：体积小、矢量无损放大、可应用文本样式、可通过 TextSpan 与文本混用。

## 演示效果

| 代码 | 运行效果 |
|:---:|:---:|
| ![代码截图](assets/演示截图/3.3%20图片及ICON-代码.png) | ![运行效果](assets/演示截图/3.3%20图片及ICON-运行效果.png) |

## 核心代码示例

### 网络图片加载

```dart
// 快捷构造函数
Image.network(
  'https://avatars2.githubusercontent.com/u/20411648?s=460&v=4',
  width: 100.0,
)

// 通过 ImageProvider
Image(
  image: const NetworkImage(
    'https://avatars2.githubusercontent.com/u/20411648?s=460&v=4',
  ),
  width: 100.0,
)
```

### BoxFit 缩放模式

```dart
Image.network(url, width: 100, height: 50, fit: BoxFit.fill)
Image.network(url, width: 100, height: 50, fit: BoxFit.contain)
Image.network(url, width: 100, height: 50, fit: BoxFit.cover)
Image.network(url, width: 100, height: 50, fit: BoxFit.fitWidth)
Image.network(url, width: 100, height: 50, fit: BoxFit.fitHeight)
Image.network(url, width: 100, height: 50, fit: BoxFit.scaleDown)
Image.network(url, width: 100, height: 50, fit: BoxFit.none)
```

### 颜色混合 & 重复

```dart
Image.network(
  url,
  width: 100.0,
  color: Colors.blue,
  colorBlendMode: BlendMode.difference,
)

Image.network(
  url,
  width: 100.0,
  height: 200.0,
  repeat: ImageRepeat.repeatY,
)
```

### Material Design 图标

```dart
const Row(
  children: [
    Icon(Icons.accessible, color: Colors.green),
    Icon(Icons.error, color: Colors.green),
    Icon(Icons.fingerprint, color: Colors.green),
  ],
)
```

## 独立运行

```bash
flutter run lib/chapter3/img_and_icon.dart
```

或直接在 IDE 中打开该文件，运行文件内的 `main()` 即可。

---

> 📖 完整章节目录及更多小节请运行 `flutter run` 查看主入口。
