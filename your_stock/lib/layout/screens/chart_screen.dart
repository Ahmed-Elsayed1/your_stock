import 'package:your_stock/layout/screens/about.dart';
import 'package:your_stock/layout/screens/chart_screen_design.dart';
import 'package:your_stock/layout/screens/monthly.dart';
import 'package:your_stock/layout/screens/news_stock_screen.dart';
import 'package:flutter/material.dart';
import 'package:your_stock/layout/screens/weekly.dart';
import 'package:your_stock/models/machine_learning.dart';
import 'package:your_stock/models/watchlist.dart';

class ChartScreen extends StatefulWidget {
  final String symbol;

  const ChartScreen({super.key, required this.symbol});

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  int selectedScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // AppBar code...
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          // Watchlist button
          WatchlistButton(symbol: widget.symbol),
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
                        //The Symbol
                        Text(
                          widget.symbol,
                          style: TextStyle(
                            color: Colors.deepOrange.shade200,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  fun(),
                  Padding(
                    padding: EdgeInsets.zero,
                    child: Column(
                      children: [
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildButton('60S', 0),
                              const SizedBox(
                                width: 2,
                              ),
                              buildButton('1W', 1),
                              const SizedBox(
                                width: 2,
                              ),
                              buildButton('1M', 2),
                            ],
                          ),
                        ),
                      ],
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
                  // Predection
                  PredictionButton(symbol: widget.symbol),
                  const SizedBox(
                    height: 40,
                  ),

                  // About
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
                      AboutScreen(
                        symbol: widget.symbol,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            // News
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
    );
  }

  fun() {
    if (selectedScreenIndex == 0) {
      return ChartScreenDesign(symbol: widget.symbol);
    } else if (selectedScreenIndex == 1) {
      return WeeklyChartScreenDesign(symbol: widget.symbol);
    } else if (selectedScreenIndex == 2) {
      return MonthlyChartScreenDesign(symbol: widget.symbol);
    } else {
      // Empty container
      return Container();
    }
  }

  Widget buildButton(String title, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedScreenIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black54),
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.black54,
            ),
          ),
        ),
      ),
    );
  }
}
