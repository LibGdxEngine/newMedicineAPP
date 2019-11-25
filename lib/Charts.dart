import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartSample1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LineChartSample1State();
}

class LineChartSample1State extends State<LineChartSample1> {
  bool isShowingMainData;

  StreamController<LineTouchResponse> controller;
  @override
  void initState() {
    super.initState();

    controller = StreamController();
    controller.stream.distinct().listen((LineTouchResponse response) {
      /// do whatever you want and change any property of the chart.
      bool isEmpty = response.spots.isEmpty;
      print('spots are $isEmpty');
    });

    isShowingMainData = true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AspectRatio(
        aspectRatio: 1.23,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(18)),
              gradient: LinearGradient(
                colors: const [
                  Colors.white,
                  Colors.white,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              )),
          child: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const SizedBox(
                    height: 37,
                  ),
//                  Text(
//                    'Unfold blood 2019',
//                    style: TextStyle(
//                      color: Colors.black54,
//                      fontSize: 16,
//                    ),
//                    textAlign: TextAlign.center,
//                  ),
//                  const SizedBox(
//                    height: 4,
//                  ),
//                  Text(
//                    'Daily records',
//                    style: TextStyle(
//                        color: Colors.black54,
//                        fontSize: 32,
//                        fontWeight: FontWeight.bold,
//                        letterSpacing: 2),
//                    textAlign: TextAlign.center,
//                  ),
                  const SizedBox(
                    height: 37,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16.0, left: 6.0),
                      child: FlChart(
                        swapAnimationDuration: Duration(milliseconds: 250),
                        chart: LineChart(
                          isShowingMainData ? sampleData1() : sampleData2(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
//              IconButton(
//                icon: Icon(
//                  Icons.refresh,
//                  color:
//                      Colors.black54.withOpacity(isShowingMainData ? 1.0 : 1.0),
//                ),
//                onPressed: () {
//                  setState(() {
//                    isShowingMainData = !isShowingMainData;
//                  });
//                },
//              )
            ],
          ),
        ),
      ),
    );
  }

  LineChartData sampleData1() {
    return LineChartData(
      lineTouchData: LineTouchData(
          touchResponseSink: controller.sink,
          touchTooltipData: TouchTooltipData(
            tooltipBgColor: Colors.black54.withOpacity(0.8),
          )),
      gridData: const FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          textStyle: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          margin: 10,
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return '1 Jan';
              case 7:
                return '2 Jan';
              case 12:
                return '3 Jan';
            }
            return '';
          },
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '100';
              case 2:
                return '150';
              case 3:
                return '200';
              case 4:
                return '250';
            }
            return '';
          },
          margin: 8,
          reservedSize: 30,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border(
            bottom: BorderSide(
              color: Colors.black54,
              width: 4,
            ),
            left: BorderSide(
              color: Colors.transparent,
            ),
            right: BorderSide(
              color: Colors.transparent,
            ),
            top: BorderSide(
              color: Colors.transparent,
            ),
          )),
      minX: 0,
      maxX: 14,
      maxY: 4,
      minY: 0,
      lineBarsData: linesBarData1(),
    );
  }

  List<LineChartBarData> linesBarData1() {
    return [
      const LineChartBarData(
        spots: [
          FlSpot(1, 1),
          FlSpot(3, 1.5),
          FlSpot(5, 1.4),
          FlSpot(7, 3.4),
          FlSpot(10, 2),
          FlSpot(12, 2.2),
          FlSpot(13, 1.8),
        ],
        isCurved: true,
        colors: [
          Colors.blue,
        ],
        barWidth: 5,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: false,
        ),
      ),
//      const LineChartBarData(
//        spots: [
//          FlSpot(1, 1),
//          FlSpot(3, 2.8),
//          FlSpot(7, 1.2),
//          FlSpot(10, 2.8),
//          FlSpot(12, 2.6),
//          FlSpot(13, 3.9),
//        ],
//        isCurved: true,
//        colors: [
//          Color(0xffaa4cfc),
//        ],
//        barWidth: 8,
//        isStrokeCapRound: true,
//        dotData: FlDotData(
//          show: false,
//        ),
//        belowBarData: BarAreaData(show: false, colors: [
//          Color(0x00aa4cfc),
//        ]),
//      ),
//      const LineChartBarData(
//        spots: [
//          FlSpot(1, 2.8),
//          FlSpot(3, 1.9),
//          FlSpot(6, 3),
//          FlSpot(10, 1.3),
//          FlSpot(13, 2.5),
//        ],
//        isCurved: true,
//        colors: [
//          Color(0xff27b6fc),
//        ],
//        barWidth: 8,
//        isStrokeCapRound: true,
//        dotData: FlDotData(
//          show: false,
//        ),
//        belowBarData: BarAreaData(
//          show: false,
//        ),
//      ),
    ];
  }

  LineChartData sampleData2() {
    return LineChartData(
      lineTouchData: const LineTouchData(enabled: false),
      gridData: const FlGridData(
        drawHorizontalGrid: true,
        drawVerticalGrid: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        show: true,
      ),
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          textStyle: TextStyle(
            color: const Color(0xff72719b),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          margin: 10,
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return 'SEPT';
              case 7:
                return 'OCT';
              case 12:
                return 'DEC';
            }
            return '';
          },
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: TextStyle(
            color: const Color(0xff75729e),
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '100';
              case 2:
                return '150';
              case 3:
                return '200';
              case 4:
                return '250';
              case 5:
                return '300';
            }
            return '';
          },
          margin: 8,
          reservedSize: 30,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border(
            bottom: BorderSide(
              color: const Color(0xff4e4965),
              width: 4,
            ),
            left: BorderSide(
              color: Colors.transparent,
            ),
            right: BorderSide(
              color: Colors.transparent,
            ),
            top: BorderSide(
              color: Colors.transparent,
            ),
          )),
      minX: 0,
      maxX: 14,
      maxY: 6,
      minY: 0,
      lineBarsData: linesBarData2(),
    );
  }

  List<LineChartBarData> linesBarData2() {
    return [
      const LineChartBarData(
        spots: [
          FlSpot(1, 1),
          FlSpot(3, 4),
          FlSpot(5, 1.8),
          FlSpot(7, 5),
          FlSpot(10, 2),
          FlSpot(12, 2.2),
          FlSpot(13, 1.8),
        ],
        isCurved: true,
        curveSmoothness: 0,
        colors: [
          Color(0x444af699),
        ],
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: false,
        ),
      ),
      const LineChartBarData(
        spots: [
          FlSpot(1, 1),
          FlSpot(3, 2.8),
          FlSpot(7, 1.2),
          FlSpot(10, 2.8),
          FlSpot(12, 2.6),
          FlSpot(13, 3.9),
        ],
        isCurved: true,
        colors: [
          Color(0x99aa4cfc),
        ],
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(show: true, colors: [
          Color(0x33aa4cfc),
        ]),
      ),
      const LineChartBarData(
        spots: [
          FlSpot(1, 3.8),
          FlSpot(3, 1.9),
          FlSpot(6, 5),
          FlSpot(10, 3.3),
          FlSpot(13, 4.5),
        ],
        isCurved: false,
        curveSmoothness: 0,
        colors: [
          Color(0x4427b6fc),
        ],
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: true,
        ),
        belowBarData: BarAreaData(
          show: false,
        ),
      ),
    ];
  }

  @override
  void dispose() {
    super.dispose();
    controller.close();
  }
}
