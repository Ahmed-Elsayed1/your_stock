import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:your_stock_core/your_stock_core.dart';

import '../cubit/cubit.dart';

//TODO: remove this and use [StockDetailsChartWidget] instead
class WeeklyStockDetailsChartWidget extends StatelessWidget {
  final String symbol;

  const WeeklyStockDetailsChartWidget({super.key, required this.symbol});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StockDetailsCubit(symbol)..getDataWeekly(),
      child: BlocBuilder<StockDetailsCubit, StockDetailsState>(
        builder: (context, state) {
          if (state is StocksLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is StocksLoaded) {
            final stocks = state.stocks;
            final chartData = state.chartData;

            return Column(
              children: [
                Text(
                  '\$${stocks.timeSeries![0].close}',
                  style: GoogleFonts.sora(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SfCartesianChart(
                  primaryXAxis: DateTimeAxis(
                    dateFormat: DateFormat.yMd(),
                    majorGridLines: const MajorGridLines(width: 0),
                  ),
                  primaryYAxis: NumericAxis(
                    numberFormat: NumberFormat.simpleCurrency(),
                  ),
                  series: <CartesianSeries<DataPointModel, DateTime>>[
                    CandleSeries<DataPointModel, DateTime>(
                      name: symbol,
                      dataSource: chartData,
                      xValueMapper: (DataPointModel point, _) => point.xValue,
                      lowValueMapper: (DataPointModel point, _) => point.low,
                      highValueMapper: (DataPointModel point, _) => point.high,
                      openValueMapper: (DataPointModel point, _) => point.open,
                      closeValueMapper: (DataPointModel point, _) =>
                          point.close,
                    ),
                  ],
                  zoomPanBehavior: ZoomPanBehavior(
                    enablePanning: true,
                    enablePinching: true,
                    enableDoubleTapZooming: true,
                    enableMouseWheelZooming: true,
                  ),
                  tooltipBehavior: TooltipBehavior(enable: true),
                ),
              ],
            );
          } else if (state is StocksError) {
            return Center(
              child: Text(state.error),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
