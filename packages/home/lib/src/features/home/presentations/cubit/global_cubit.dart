import 'package:your_stock_core/your_stock_core.dart';

import 'global_state.dart';

@injectable
class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(const GlobalState.initial());

}
