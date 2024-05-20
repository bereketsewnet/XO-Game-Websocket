const express = require("express");
const http = require("http");
const mongoose = require("mongoose");

const app = express();
const port = process.env.PORT || 3000;
var server = http.createServer(app);

var io = require("socket.io")(server);
io.on("connection", (socket) => {
  console.log('connected to socket');
   socket.on("createRoom", ({nickname}) => {
      console.log(nickname);
   });
});
// middle ware
app.use(express.json());
const DB = "mongodb+srv://bereket:65500639@cluster0.lf8hh5u.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";
mongoose.connect(DB)
.then(()=> {
  console.log("connection successful!");
})
 .catch((e) => {
   console.log(e);
});

server.listen(port, '0.0.0.0', () => {
  console.log("server started");
});
// mongodb+srv://bereket:65500639@cluster0.lf8hh5u.mongodb.net/