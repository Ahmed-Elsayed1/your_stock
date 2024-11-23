import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class PredictionButton extends StatefulWidget {
  final String symbol;

  const PredictionButton({super.key, required this.symbol});
  @override
  State<StatefulWidget> createState() => _PredictionButton();
}

class _PredictionButton extends State<PredictionButton> {
  String predictionText = 'THE PREDICTION';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () async {
            String result = await fetchModelData(widget.symbol);
            String prediction = '$result at the beginning of the week!';
            setState(() {
              predictionText = prediction;
            });
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
            textStyle: const TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
            alignment: Alignment.center,
            backgroundColor: Colors.deepOrange.withOpacity(0.7),
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
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

Future<String> executeCloudFunction(String variable) async {
  const url =
      'https://us-central1-your-stock-project.cloudfunctions.net/executeScript';

  Map<String, dynamic> requestBody = {
    'variable': variable,
  };

  final response = await post(
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

    dynamic jsonResult = jsonDecode(result);
    int predictionValue = jsonResult['result'];

    if (predictionValue == 0) {
      prediction = 'Will fall';
    } else {
      prediction = 'Will raise';
    }
    return prediction;
  } catch (error) {
    return 'Error: $error';
  }
}
