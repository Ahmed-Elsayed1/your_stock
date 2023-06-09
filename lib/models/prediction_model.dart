import 'package:flython/flython.dart';

class InitializeFlython extends Flython {
  static const cmdToPredict = 1;

  Future<dynamic> predictStock(
    String inputFile,
    String outputFile,
    // String pythonFilePath,
  ) async {
    var command = {
      "cmd": cmdToPredict,
      "input": inputFile,
      "output": outputFile,
    };
    return await runCommand(command);
  }
}
