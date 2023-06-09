const functions = require("firebase-functions");
const spawn = require("child-process-promise").spawn;

exports.executePythonScript = functions.https.onRequest(async (req, res) => {
  res.set("Access-Control-Allow-Origin", "*");
  res.set("Access-Control-Allow-Methods", "GET, POST");
  res.set("Access-Control-Allow-Headers", "Content-Type");

  if (req.method === "OPTIONS") {
    // Preflight request, respond with 204
    res.status(204).send("");
    return;
  }
  try {
    // Extract the variable from the request
    const variable = req.body.variable;

    // Execute the Python script with the variable
    const pythonProcess = spawn("python", ["main.py", variable]);
    
    pythonProcess.childProcess.stdout.on("data", (data) => {
      const output = data.toString().trim();
      res.status(200).send(output);
    });

    // const result = await pythonProcess.childProcess.promise;
    await pythonProcess.childProcess.promise;
  } catch (error) {
    console.error(error);
    res.status(500).send(
     "An error occurred while executing the Cloud Function.");
  }
});
