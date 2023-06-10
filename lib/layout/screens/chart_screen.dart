import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:yourstock/layout/screens/news_stock_screen.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yourstock/services/crud/cloud_firestore_service.dart';

class ChartScreen extends StatefulWidget {
  final String symbol;

  const ChartScreen({Key? key, required this.symbol}) : super(key: key);

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  final bool favorite = false;

  final CloudDb cloudDb = CloudDb();
  bool? isWatched;
  String predictionText = 'THE PREDICTION';
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: checkExistance(widget.symbol),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        } else {
          isWatched = snapshot.data!;

          return Scaffold(
            backgroundColor: Colors.white,
            // Rest of the scaffold code...
            appBar: AppBar(
              // AppBar code...
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: [
                IconButton(
                  onPressed: () async {
                    await changeWatchlistState(widget.symbol);
                    // changeWatchlistState(widget.symbol);
                  },
                  icon: Icon(
                    isWatched! ? Icons.favorite : Icons.favorite_border,
                  ),
                ),
              ],
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.deepOrange.shade100,
                ),
              ),
              // Rest of the appBar code...
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Column(
                            children: [
                              Text(
                                widget.symbol,
                                style: TextStyle(
                                  color: Colors.deepOrange.shade200,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                '\$ 125.85',
                                style: GoogleFonts.sora(
                                  fontSize: 40,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 250,
                          child: LineChart(
                            mainData(),
                            swapAnimationDuration:
                                const Duration(microseconds: 1000),
                            swapAnimationCurve: Curves.linear,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                String prediction =
                                    await fetchModelData(widget.symbol);
                                setState(() {
                                  predictionText = prediction;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 60, vertical: 20),
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                                alignment: Alignment.center,
                                backgroundColor:
                                    Colors.deepOrange.withOpacity(0.7),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text('Predict'.toUpperCase()),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              predictionText,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'About',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'International Business Machines Corporation (IBM) is an American multinational technology company headquartered in Armonk, New York, with operations in over 170 countries...',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 14,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Relevant News',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        NewsStockScreen(
                          symbol: widget.symbol,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Rest of the scaffold code...
          );
        }
      },
    );
  }

  final List<Color> gradientColors = [
    Colors.orangeAccent,
    Colors.deepOrange,
  ];

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: 1.6,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            dashArray: [3, 3],
            color: Colors.orangeAccent.withOpacity(0.2),
            strokeWidth: 2,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 22,
            interval: 1,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            reservedSize: 15,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.4, 2),
            FlSpot(4.4, 5),
            FlSpot(6.6, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.1))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  Future<File> get localFile async {
    Directory appDocDirectory = await getApplicationDocumentsDirectory();
    String filePath = path.join(appDocDirectory.path, 'ticker.txt');

    return File(filePath);
  }

  Future<String> writeTicker() async {
    final file = await localFile;

    // Write the file
    await file.writeAsString(widget.symbol);
    return file.path;
  }

  Future<String> createOutputFile() async {
    Directory appDocDirectory = await getApplicationDocumentsDirectory();
    String filePath = path.join(appDocDirectory.path, 'prediction.txt');
    File(filePath);

    return filePath;
  }

  Future<String> readPrediction() async {
    try {
      File file = File(await createOutputFile());

      final contents = await file.readAsString();

      return contents;
    } catch (e) {
      return "Couldn't predict";
    }
  }

  Future<void> changeWatchlistState(String ticker) async {
    bool isExist = await cloudDb.isValueExist("ticker", ticker);
    if (isExist) {
      await cloudDb.removeItemFromUserData("ticker", ticker);
      isExist = !isExist;
    } else {
      await cloudDb.addItemToUserData("ticker", ticker);
      isExist = !isExist;
    }
    setState(() {
      isWatched = isExist;
    });
  }

  Future<bool> checkExistance(String ticker) async {
    bool isExist = await cloudDb.isValueExist("ticker", ticker);
    return isExist;
  }
}

Future<String> executeCloudFunction(String variable) async {
  const url =
      'https://us-central1-your-stock-project.cloudfunctions.net/executeScript';

  Map<String, dynamic> requestBody = {
    'variable': variable,
  };

  final response = await http.post(
    Uri.parse(url),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(requestBody),
  );

  if (response.statusCode == 200) {
    return response.body; // Assuming the response contains the script result
  } else {
    throw Exception('Failed to execute Cloud Function');
  }
}

Future<String> fetchModelData(String variable) async {
  try {
    String prediction;
    String result = await executeCloudFunction(variable);
    // Handle the result here

    dynamic jsonResult = jsonDecode(result);
    int predictionValue = jsonResult['result'];

    if (predictionValue == 0) {
      prediction = 'Will fall!';
    } else {
      prediction = 'Will raise!';
    }
    // log('Prediction: $prediction');
    return prediction;
  } catch (error) {
    // Handle any errors that occur during the HTTP request
    log('Error: $error');
    return 'Error: $error';
  }
}
