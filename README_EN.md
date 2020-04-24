# ai_chart

![totem](https://raw.githubusercontent.com/pdliuw/pdliuw.github.io/master/images/totem_four_logo.jpg)

-----

|[English Document](https://github.com/pdliuw/ai_chart/blob/master/README_EN.md)|[中文文档](https://github.com/pdliuw/ai_chart)|
|:-|:-|

## Our aim is to help developers make development more convenient and experience the beauty of programming!

### ai_chart:

[![pub package](https://img.shields.io/pub/v/ai_chart.svg)](https://pub.dev/packages/ai_chart)


[ai_chart](https://github.com/pdliuw/ai_chart) 在[项目](https://github.com/flutter-app-sample/flutter_app_sample)中的实战应用[flutter sample](https://github.com/flutter-app-sample/flutter_app_sample)

## effect

|iOS|Android|
|:-|:-|
|![ai_chart->ios](https://github.com/pdliuw/ai_chart/blob/master/example/gif/chart_ios.gif)|![ai_chart->android](https://github.com/pdliuw/ai_chart/blob/master/example/gif/chart_android.gif)|
|:-|:-|

|macOS|web|
|:-|:-|
|![ai_chart->macOS](https://github.com/pdliuw/ai_chart/blob/master/example/gif/chart_macOS.gif)|![ai_chart->web](https://github.com/pdliuw/ai_chart/blob/master/example/gif/chart_web.gif)|
|:-|:-|



## 1.Installation

Use the current package as a dependent library


### 1. Rely on this library

Add in file 'pubspec.yaml'

[![pub package](https://img.shields.io/pub/v/ai_chart.svg)](https://pub.dev/packages/ai_chart)

```

dependencies:

  ai_chart: ^version

```

or

```

  # chart package.
  ai_chart:
    git:
      url: https://github.com/pdliuw/ai_chart.git

```

### 2. 安装此库

You can install this library via the command line below

```

$ flutter pub get


```

You can also perform the above steps through the visual operation through the project development tool

### 3. Import this library

Now, in your Dart editing code, you can use:

```

import 'package:ai_chart/ai_chart.dart';

```

## 2.Usage


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

*6、More usage[click to see more](https://github.com/pdliuw/ai_chart/blob/master/example/READ.md)


## LICENSE


    BSD 3-Clause License
    
    Copyright (c) 2020, pdliuw
    All rights reserved.
