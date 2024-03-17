import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyChart extends StatefulWidget {
  MyChart({super.key});

  @override
  State<MyChart> createState() => _MyChartState();
}

class _MyChartState extends State<MyChart> {
  @override
  Widget build(BuildContext context) {
    return BarChart(
      mainBarData(),
    );
  }

  BarChartGroupData makeGroupData (int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          width: 15,
          toY: y,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 5,
            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.1),
          ),
        ),
      ],
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(8, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 2);
          case 1:
            return makeGroupData(1, 3);
          case 2:
            return makeGroupData(2, 2);
          case 3:
            return makeGroupData(3, 4.5);
          case 4:
            return makeGroupData(4, 3.8);
          case 5:
            return makeGroupData(5, 1.5);
          case 6:
            return makeGroupData(6, 4);
          case 7:
            return makeGroupData(7, 2.5);
          default:
            return throw Error();
        }
      });

  BarChartData mainBarData() {
    return BarChartData(
      titlesData: FlTitlesData(
        show: true,
        rightTitles:
            const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: leftTitles
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 40,
            getTitlesWidget: getTitles,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      gridData: const FlGridData(
        show: false,
      ),
      barGroups: showingGroups(),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    TextStyle style = TextStyle(
      color: Theme.of(context).colorScheme.onBackground,
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    Widget text;

    switch (value.toInt()) {
      case 0:
        text = Text('01', style: style);
        break;
      case 1:
        text = Text('02', style: style);
        break;
      case 2:
        text = Text('03', style: style);
        break;
      case 3:
        text = Text('04', style: style);
        break;
      case 4:
        text = Text('05', style: style);
        break;
      case 5:
        text = Text('06', style: style);
        break;
      case 6:
        text = Text('07', style: style);
        break;
      case 7:
        text = Text('08', style: style);
        break;

      default:
        text = Text('', style: style);
        break;
    }
    return SideTitleWidget(axisSide: meta.axisSide, space: 16, child: text);
  }

  Widget leftTitles(double value, TitleMeta meta) {
    TextStyle style = TextStyle(
      color: Theme.of(context).colorScheme.onBackground,
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;

    if (value == 0) {
      text = 'P 1K';
    } else if (value == 1) {
      text = 'P 2K';
    } else if (value == 2) {
      text = 'P 3K';
    } else if (value == 3) {
      text = 'P 4K';
    } else if (value == 4) {
      text = 'P 5K';
    } else {
      return Container();
    }
    return SideTitleWidget(
        axisSide: meta.axisSide, space: 0, child: Text(text, style: style));
  }
}
