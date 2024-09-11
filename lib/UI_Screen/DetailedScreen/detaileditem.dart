import 'dart:async';
import 'dart:math';
import 'package:coffeewithcoin/Models/datamodel.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DetailedItem extends StatefulWidget {
  final DataModel coin;
  const DetailedItem({super.key, required this.coin});

  @override
  State<DetailedItem> createState() => _DetailedItemState();
}

class _DetailedItemState extends State<DetailedItem> {
  late Stream<List<double>> sparklineStream;
  late StreamSubscription<List<double>> sparklineSubscription;

  @override
  void initState() {
    super.initState();
    sparklineStream = _generateSparklineStream(widget.coin.sparklineIn7D!.price);
    sparklineSubscription = sparklineStream.listen((data) {
      setState(() {
        sparklineData = data
            .asMap()
            .entries
            .map((entry) => FlSpot(entry.key.toDouble(), entry.value))
            .toList();
      });
    });
  }

  @override
  void dispose() {
    sparklineSubscription.cancel();
    super.dispose();
  }

  List<FlSpot> sparklineData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.coin.id),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Symbol: ${widget.coin.symbol}'),
            Text('Current Price: ${widget.coin.currentPrice.toStringAsFixed(2)}'),
            Text('Price Change Percentage: ${widget.coin.priceChangePercentage24H.toStringAsFixed(2)}%'),
            SizedBox(height: 16.0),
            AspectRatio(
              aspectRatio: 1.7,
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: sparklineData,
                      isCurved: true,
                      color: Colors.blue,
                      barWidth: 2,
                      isStrokeCapRound: true,
                      dotData: FlDotData(
                        show: false,
                      ),
                      belowBarData: BarAreaData(
                        show: true,
                        color: Colors.blue.withOpacity(0.2),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Stream<List<double>> _generateSparklineStream(List<double> initialData) async* {
    yield initialData;
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      yield _updateSparklineData(initialData);
    }
  }

  List<double> _updateSparklineData(List<double> data) {
    final updatedData = List<double>.from(data);
    final lastValue = updatedData.last;
    final nextValue = lastValue + (lastValue * (0.05 * (Random().nextBool() ? 1 : -1)));
    updatedData.removeLast();
    updatedData.insert(0, nextValue);
    return updatedData;
  }
}