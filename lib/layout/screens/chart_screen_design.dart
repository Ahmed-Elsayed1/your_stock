import 'package:yourstock/shared/app_cubit/charts_cubit/chart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class ChartScreenDesign extends StatelessWidget {
  final String symbol;

  const ChartScreenDesign({super.key, required this.symbol});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StocksCubit(symbol)..getDataminute(),
      child: BlocBuilder<StocksCubit, StocksState>(
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
                    dateFormat: DateFormat.Hms(),
                    majorGridLines: const MajorGridLines(width: 0),
                  ),
                  primaryYAxis:
                      NumericAxis(numberFormat: NumberFormat.simpleCurrency()),
                  series: <CartesianSeries<DataPoint, DateTime>>[
                    CandleSeries<DataPoint, DateTime>(
                      name: symbol,
                      dataSource: chartData,
                      xValueMapper: (DataPoint point, _) => point.xValue,
                      lowValueMapper: (DataPoint point, _) => point.low,
                      highValueMapper: (DataPoint point, _) => point.high,
                      openValueMapper: (DataPoint point, _) => point.open,
                      closeValueMapper: (DataPoint point, _) => point.close,
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
