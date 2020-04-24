import 'dart:ui';

/// AirChartData
class AirChartData {
  num _value;
  Color _color;

  AirChartData({num value,Color color}) {
    _value = value;
    _color = color;
  }

  num get value => _value;
  set value(num value) {
    assert(value >= 0);
    _value = value;
  }

  Color get color => _color;

}
