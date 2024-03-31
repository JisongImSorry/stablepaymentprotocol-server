var http = require("http");
const { exec } = require("child_process");

//create a server object:
http
  .createServer(function (req, res) {
    exec("npm run deploy", (error, stdout, stderr) => {
      if (error) {
        console.log(`error: ${error.message}`);
        return;
      }
      if (stderr) {
        console.log(`stderr: ${stderr}`);
        return;
      }
      console.log(`stdout: ${stdout}`);

      let p1 = stdout.split("(tx: ")[1];
      let p2 = p1.split(")")[0];
      console.log("contract address", p2);
      let loc = "https://alfajores.celoscan.io/tx/" + p2;
      console.log(loc);

      res.setHeader("Access-Control-Allow-Origin", "*");
      res.write(p2);
      res.end(); //end the response
    });
  })
  .listen(8080); //the server object listens on port 8080
