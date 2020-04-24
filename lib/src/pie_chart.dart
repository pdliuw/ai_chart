import 'package:ai_chart/src/chart_data_model.dart';
import 'package:flutter/material.dart';

import 'progress_mixin.dart';

/// AirPieChart
// ignore: must_be_immutable
class AirPieChart extends StatefulWidget {
  /// Limited min value
  static const double LIMITED_MIN_VALUE = 0;

  /// Limited max value
  static const double LIMITED_MAX_VALUE = 100;

  /// default value
  static const double DEFAULT_VALUE = 10;

  Size _size;
  double _min;
  double _max;
  num _value;
  Color _pathColor;
  Color _valueColor;
  double _pathStrokeWidth;
  double _valueStrokeWidth;
  bool _filled;
  bool _useCenter;
  bool _roundCap;

  List<AirChartData> _pieChartList;

  /// constructor
  AirPieChart({
    @required Size size,
    @required List<AirChartData> pieChartData,
    double min = LIMITED_MIN_VALUE,
    double max = LIMITED_MAX_VALUE,
    num value = DEFAULT_VALUE,
    Color pathColor = Colors.white,
    Color valueColor = Colors.green,
    double pathStrokeWidth = 5,
    double valueStrokeWidth = 5,
    bool filled = false,
    bool useCenter = false,
    bool roundCap = true,
  }) {
    assert(size != null);
    assert(min >= LIMITED_MIN_VALUE);
    assert(max <= LIMITED_MAX_VALUE);
    assert(value >= min);
    assert(value <= max);
    assert(pathColor != null);
    assert(valueColor != null);
    assert(pathStrokeWidth != null);
    assert(valueStrokeWidth != null);
    assert(filled != null);
    assert(useCenter != null);
    assert(roundCap != null);
    assert(pieChartData != null);
    _size = size;
    //value
    _value = value;
    _min = min;
    _max = max;
    //color
    _pathColor = pathColor;
    _valueColor = valueColor;
    //stroke width
    _pathStrokeWidth = pathStrokeWidth;
    _valueStrokeWidth = valueStrokeWidth;

    //
    _filled = filled;
    _useCenter = useCenter;
    _roundCap = roundCap;

    //The strokeWidth is zero when _filled is true,
    if (_filled) {
      _pathStrokeWidth = 0.0;
      _valueStrokeWidth = 0.0;
    }

    //chart data
    _pieChartList = pieChartData;

    //reset zero
    _max = 0;
    _pieChartList.forEach((AirChartData chartData) {
      _max = _max + chartData.value;
    });
  }

  @override
  State<StatefulWidget> createState() {
    return _CircularStateProgressIndicatorState();
  }
}

/// _CircularStateProgressIndicatorState
class _CircularStateProgressIndicatorState extends State<AirPieChart> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: widget._size,
      painter: CircularProgressPaint._(
        shouldRepaint: false,
        min: widget._min,
        max: widget._max,
        chartDataList: widget._pieChartList,
        pathPaint: _getPathPaint(),
        valuePaint: _getValuePaint(),
        useCenter: widget._useCenter,
      ),
    );
  }

  Paint _getPathPaint() {
    return Paint()
      ..color = widget._pathColor
      ..strokeWidth = widget._pathStrokeWidth
      ..strokeCap = widget._roundCap ? StrokeCap.round : StrokeCap.square
      ..strokeJoin = widget._roundCap ? StrokeJoin.round : StrokeJoin.bevel
      ..style = widget._filled ? PaintingStyle.fill : PaintingStyle.stroke;
  }

  Paint _getValuePaint({Color color}) {
    return Paint()
      ..color = color ?? widget._valueColor
      ..strokeWidth = widget._valueStrokeWidth
      ..strokeCap = widget._roundCap ? StrokeCap.round : StrokeCap.square
      ..strokeJoin = widget._roundCap ? StrokeJoin.round : StrokeJoin.bevel
      ..style = widget._filled ? PaintingStyle.fill : PaintingStyle.stroke;
  }
}

/// CircularProgressPaint
class CircularProgressPaint extends CustomPainter with ProgressMixin {
  /// The max sweep angle exclude stroke cap
  final num maxSweepAngleExcludeCap = 6.2;

  /// The max sweep angle include stroke cap
  final num maxSweepAngleIncludeCap = 6.5;
  final num minSweepAngle = 1.0;

  /// start angle
  static const double DEFAULT_START_ANGLE = -1.5;

  bool _shouldRepaint;
  num _min;
  num _max;
  List<AirChartData> _chartDataList;
  Paint _pathPaint;
  Paint _valuePaint;
  bool _useCenter;

  /// CircularProgressPaint
  ///
  CircularProgressPaint._({
    @required bool shouldRepaint,
    @required num min,
    @required num max,
    @required List<AirChartData> chartDataList,
    @required Paint pathPaint,
    @required Paint valuePaint,
    @required bool useCenter,
  }) {
    _shouldRepaint = shouldRepaint;
    _min = min;
    _max = max;
    _chartDataList = chartDataList;
    _pathPaint = pathPaint;
    _valuePaint = valuePaint;
    _useCenter = useCenter;
  }
  @override
  void paint(Canvas canvas, Size size) {
    // draw progress path
    drawProgressPath(canvas: canvas, paint: _pathPaint, size: size);

    // draw progress value
    drawProgressValue(canvas: canvas, paint: _valuePaint, size: size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return _shouldRepaint;
  }

  @override
  drawProgressPath({Canvas canvas, Paint paint, Size size}) {
    Offset center = _getOffset(size: size);
    double radius = _getRadius(size: size);
    canvas.drawCircle(center, radius, paint);
  }

  @override
  drawProgressValue({Canvas canvas, Paint paint, Size size}) {
    Offset center = _getOffset(size: size);
    double radius = _getRadius(size: size);
    int index = -1;
    _chartDataList.forEach((AirChartData chart) {
      index++;
      print("first->index:$index");
      num value = chart.value;
      Color color = chart.color;

      Paint drawPaint = paint;
      drawPaint.color = color;
//      drawPaint.blendMode = BlendMode.srcIn;

      canvas.drawArc(
          Rect.fromCircle(center: center, radius: radius),
          _getStartAngle(index: index),
          _getChartTotalAngle(value: value, max: _max),
          useCenter,
          drawPaint);
    });

    //clip
//    Path clipPath = Path();
//    clipPath.addArc(
//        Rect.fromCircle(center: center, radius: radius / 2), -1, 6.5);
//    clipPath.close();
//
//    canvas.clipPath(clipPath);
  }

  double _getStartAngle({int index}) {
//    if (index == 0) {
//      return DEFAULT_START_ANGLE;
//    } else {
    int flag = -1;
    double startAngle = DEFAULT_START_ANGLE;
    _chartDataList.forEach(
      (AirChartData chart) {
        flag++;
        if (flag < index) {
          startAngle =
              startAngle + _getChartTotalAngle(value: chart.value, max: _max);
        }

        print("startAngle: $startAngle");
      },
    );
    return startAngle;
//    }
  }

  /// 获取每一份的饼图的绘制的总值
  double _getChartTotalAngle({num value, num max}) {
    return maxSweepAngleExcludeCap / max * value;
  }

  /// 获取绘制的角度值
//  double _getSweepAngle(){
//
//  }

//  double _getSweepAngle() {
//    if (_value == _min) {
//      return 0;
//    }
//    if (_value > _min && _value < maxHalf) {
//      return (_value * 0.0612);
//    }
//    if (_value == maxHalf) {
//      return _value * 0.0600;
//    }
//    if (_value > maxHalf && _value < _max) {}
//    if (_value == _max) {
//      return maxSweepAngleIncludeCap;
//    }
//    return (_value * 0.0615);
//  }

  /// the half of max value
  get maxHalf => _max / 2;

  /// useCenter
  /// whether use center point close the path.
  bool get useCenter {
    return _useCenter;
  }

  /// circular radius
  double _getRadius({Size size}) {
    double radius =
        size.width / 2 < size.height / 2 ? size.width / 2 : size.height / 2;
    radius -= _valuePaint.strokeWidth / 2;
    return radius;
  }

  /// point
  Offset _getOffset({Size size}) {
    return Offset(size.width / 2, size.height / 2);
  }
}
