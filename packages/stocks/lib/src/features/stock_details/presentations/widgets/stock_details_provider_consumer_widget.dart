import 'package:your_stock_core/your_stock_core.dart';
import 'package:your_stock_design_system/your_stock_design_system.dart';
import 'package:common/common.dart';
import 'package:news/news.dart';

import '../cubit/cubit.dart';
import 'widgets.dart';

class StockDetailsProviderConsumerWidget extends StatelessWidget {
  const StockDetailsProviderConsumerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<StockDetailsCubit>();
    return BlocListener<StockDetailsCubit, StockDetailsState>(
      listener: (context, state) => state.whenOrNull(
        onTimeSeriesChanged: (timeSeries) => switch (timeSeries) {
          TimeSeries.minute => cubit.getDataMinute(),
          TimeSeries.week => cubit.getDataWeekly(),
          TimeSeries.month => cubit.getDataMonthly(),
        },
      ),
      child: SingleChildScrollView(
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
                          cubit.stock?.symbol ?? '',
                          style: TextStyle(
                            color: Colors.deepOrange.shade200,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  StockDetailsChartWidget(symbol: cubit.stock?.symbol ?? ''),
                  const Padding(
                    padding: EdgeInsets.zero,
                    child: Column(
                      children: [
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              StockDetailsMinuteButtonWidget(),
                              AppGap.xxxs(),
                              StockDetailsWeeklyButtonWidget(),
                              AppGap.xxxs(),
                              StockDetailsMonthlyButtonWidget(),
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
                  PredictionButton(symbol: cubit.stock?.symbol ?? ''),
                  const AppGap.xxxl(),

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
                      const AppGap.s(),
                      StockDescriptionWidget(
                        symbol: cubit.stock?.symbol ?? '',
                      ),
                    ],
                  ),
                  const AppGap.l(),
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
                  const AppGap.s(),
                  StockDetailsNewsWidget(
                    symbol: cubit.stock?.symbol ?? '',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
