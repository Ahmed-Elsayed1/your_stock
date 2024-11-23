import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:your_stock_core/your_stock_core.dart';

import '../cubit/cubit.dart';

class StockDetailsChartWidget extends StatelessWidget {
  final String symbol;

  const StockDetailsChartWidget({super.key, required this.symbol});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StockDetailsCubit(symbol)..getDataminute(),
      child: BlocBuilder<StockDetailsCubit, StockDetailsState>(
        builder: (context, state) => state.maybeWhen(
          orElse: () => const SizedBox.shrink(),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          loaded: (stocks, date, chartData) => Column(
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
                series: <CartesianSeries<DataPointModel, DateTime>>[
                  CandleSeries<DataPointModel, DateTime>(
                    name: symbol,
                    dataSource: chartData,
                    xValueMapper: (DataPointModel point, _) => point.xValue,
                    lowValueMapper: (DataPointModel point, _) => point.low,
                    highValueMapper: (DataPointModel point, _) => point.high,
                    openValueMapper: (DataPointModel point, _) => point.open,
                    closeValueMapper: (DataPointModel point, _) => point.close,
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
          ),
          error: (error) => Center(
            child: Text(error),
          ),
        ),
      ),
    );
  }
}
