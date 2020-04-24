import 'package:ai_chart/ai_chart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _min = 0;
  double _max = 100;
  double _valueFirst = 50;
  double _valueSecond = 50;
  double _valueThird = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            Spacer(),
            Spacer(),
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
            Spacer(),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: Slider(
                      min: _min,
                      max: _max,
                      value: _valueFirst,
                      onChanged: (double value) {
                        setState(() {
                          _valueFirst = value.toInt().toDouble();
                        });
                      }),
                ),
                Text("$_valueFirst"),
                Container(
                  width: 20,
                ),
              ],
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: Slider(
                      min: _min,
                      max: _max,
                      value: _valueSecond,
                      onChanged: (double value) {
                        setState(() {
                          _valueSecond = value.toInt().toDouble();
                        });
                      }),
                ),
                Text("$_valueSecond"),
                Container(
                  width: 20,
                ),
              ],
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: Slider(
                      min: _min,
                      max: _max,
                      value: _valueThird,
                      onChanged: (double value) {
                        setState(() {
                          _valueThird = value.toInt().toDouble();
                        });
                      }),
                ),
                Text("$_valueThird"),
                Container(
                  width: 20,
                ),
              ],
            ),
            Spacer(),
            Spacer(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
