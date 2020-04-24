# ai_chart

![totem](https://raw.githubusercontent.com/pdliuw/pdliuw.github.io/master/images/totem_four_logo.jpg)

-----

|[English Document](https://github.com/pdliuw/ai_chart/blob/master/README_EN.md)|[中文文档](https://github.com/pdliuw/ai_chart)|
|:-|:-|

## 我们的宗旨是：帮助开发者更加便利开发、切身体会编程之美！

### ai_chart:

[![pub package](https://img.shields.io/pub/v/ai_chart.svg)](https://pub.dev/packages/ai_chart)


[ai_chart](https://github.com/pdliuw/ai_chart) 在[项目](https://github.com/flutter-app-sample/flutter_app_sample)中的实战应用[flutter sample](https://github.com/flutter-app-sample/flutter_app_sample)

## 效果图

|iOS|Android|
|:-|:-|
|![ai_chart->ios](https://github.com/pdliuw/ai_chart/blob/master/example/gif/chart_ios.gif)|![ai_chart->android](https://github.com/pdliuw/ai_chart/blob/master/example/gif/chart_android.gif)|
|:-|:-|

|macOS|web|
|:-|:-|
|![ai_chart->macOS](https://github.com/pdliuw/ai_chart/blob/master/example/gif/chart_macOS.gif)|![ai_chart->web](https://github.com/pdliuw/ai_chart/blob/master/example/gif/chart_web.gif)|
|:-|:-|


## 1.安装

使用当前包作为依赖库

### 1. 依赖此库

在文件 'pubspec.yaml' 中添加

[![pub package](https://img.shields.io/pub/v/ai_chart.svg)](https://pub.dev/packages/ai_chart)

```

dependencies:

  ai_chart: ^version

```

或以这种方式添加

```

  # chart package.
  ai_chart:
    git:
      url: https://github.com/pdliuw/ai_chart.git

```

### 2. 安装此库

你可以通过下面的命令行来安装此库

```

$ flutter pub get


```

你也可以通过项目开发工具通过可视化操作来执行上述步骤

### 3. 导入此库

现在，在你的Dart编辑代码中，你可以使用：

```

import 'package:ai_chart/ai_chart.dart';

```

## 2.使用


```

            Container(
              width: 150,
              height: 150,
              margin: EdgeInsets.all(10),
              child: AirPieChart(
                size: Size(100, 100),
                roundCap: false,
                filled: false,
                useCenter: false,
                pieChartData: [
                  AirChartData(
                    value: _valueFirst,
                    color: Colors.orange,
                  ),
                  AirChartData(
                    value: _valueSecond,
                    color: Colors.green,
                  ),
                  AirChartData(
                    value: _valueThird,
                    color: Colors.red,
                  ),
                ],
                value: 50,
                valueStrokeWidth: 20,
                pathStrokeWidth: 20,
              ),
            ),

```

*6、更多用法[点击，查看更多](https://github.com/pdliuw/ai_chart/blob/master/example/READ.md)


## LICENSE


    BSD 3-Clause License
    
    Copyright (c) 2020, pdliuw
    All rights reserved.
