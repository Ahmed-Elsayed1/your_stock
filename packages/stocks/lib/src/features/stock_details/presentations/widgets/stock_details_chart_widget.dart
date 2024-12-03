import 'package:common/common.dart';
import 'package:your_stock_design_system/your_stock_design_system.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:your_stock_core/your_stock_core.dart';

import '../cubit/cubit.dart';

class StockDetailsChartWidget extends StatelessWidget {
  final String symbol;
  final TimeSeries? timeSeries;

  const StockDetailsChartWidget({
    super.key,
    required this.symbol,
    this.timeSeries,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StockDetailsCubit, StockDetailsState>(
      builder: (context, state) {
        final cubit = context.read<StockDetailsCubit>();
        return state.maybeWhen(
          orElse: () => const SizedBox.shrink(),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (error) => Center(
            child: Text(error),
          ),
          loaded: (stocks, date, chartData) => Column(
            children: [
              Text(
                '\$${stocks.ohlc![0].close}',
                style: GoogleFonts.sora(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SfCartesianChart(
                primaryXAxis: DateTimeAxis(
                  dateFormat:
                      _getDateFormat(cubit.timeSeries ?? TimeSeries.minute),
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
        );
      },
    );
  }

  DateFormat _getDateFormat(TimeSeries timeSeries) => switch (timeSeries) {
        TimeSeries.minute => DateFormat.Hms(),
        TimeSeries.week => DateFormat.yMd(),
        TimeSeries.month => DateFormat.yMMMM(),
      };
}
