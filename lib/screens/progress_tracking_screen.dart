import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:bahrfitnesspro/services/ai_recommendations_service.dart';

class ProgressTrackingScreen extends StatefulWidget {
  const ProgressTrackingScreen({super.key});

  @override
  _ProgressTrackingScreenState createState() => _ProgressTrackingScreenState();
}

class _ProgressTrackingScreenState extends State<ProgressTrackingScreen> {
  // Sample data for progress tracking
  List<charts.Series<ProgressData, DateTime>> _seriesData;
  AIRecommendationsService _aiRecommendationsService;
  List<String> _aiInsights = [];

  @override
  void initState() {
    super.initState();
    _seriesData = _createSampleData();
    _aiRecommendationsService = AIRecommendationsService();
  }

  List<charts.Series<ProgressData, DateTime>> _createSampleData() {
    final data = [
      ProgressData(DateTime(2022, 1, 1), 70),
      ProgressData(DateTime(2022, 2, 1), 68),
      ProgressData(DateTime(2022, 3, 1), 66),
      ProgressData(DateTime(2022, 4, 1), 65),
      ProgressData(DateTime(2022, 5, 1), 63),
    ];

    return [
      charts.Series<ProgressData, DateTime>(
        id: 'Weight',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (ProgressData progress, _) => progress.date,
        measureFn: (ProgressData progress, _) => progress.value,
        data: data,
      )
    ];
  }

  Future<void> _fetchAIInsights() async {
    List<String> insights = await _aiRecommendationsService.getRecommendations([/* user data */]);
    setState(() {
      _aiInsights = insights;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Tracking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: charts.TimeSeriesChart(
                _seriesData,
                animate: true,
                dateTimeFactory: const charts.LocalDateTimeFactory(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement data filtering and comparison features
              },
              child: const Text('Filter Data'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _fetchAIInsights,
              child: const Text('Get Insights'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _aiInsights.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_aiInsights[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProgressData {
  final DateTime date;
  final int value;

  ProgressData(this.date, this.value);
}
