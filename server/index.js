const express = require("express");
const http = require("http");
const mongoose = require("mongoose");

const app = express();
const port = process.env.PORT || 3000;
var server = http.createServer(app);
const Room = require("./models/room.js");
// middle ware
app.use(express.json());

app.get('/', (req, res) => {

res.send('it work!!');
});

var io = require("socket.io")(server);
io.on("connection", (socket) => {
  console.log('connected to socket');
   socket.on("createRoom", async ({nickname}) => {
      try{

        // room creation
      let room = new Room();
      let player = {
        socketID: socket.id,
        nickname,
        playerType: 'X',
      };
      room.players.push(player);
      room.turn = player;
      // store the object of player
     room = await room.save();
     const roomId = room._id.toString();
     socket.join(roomId);
 
     // io send data to everyOne
     // socket sending data to your selfe
     io.to(roomId).emit("createRoomSuccess", room);

      }catch (e) {
        console.log(e);
      }
      
   });
   socket.on('joinRoom', async ({nickname, roomId}) => {
     try{
      // if(roomId.match(/^[0-9a-fA-F{24}$]/)){
      //   return socket.emit('errorOccurred', 'Please enter a valid room ID');
      // }

      let room = await Room.findById(roomId);
      if(room.isJoin) {
        let player = {
          nickname,
          socketID: socket.id,
          playerType: 'O'
        }
        socket.join(roomId);
        room.players.push(player);
        room.isJoin = false;
        room = await room.save();
        io.to(roomId).emit("joinRoomSuccess", room);
        io.to(roomId).emit("updatePlayers", room.players);
        io.to(roomId).emit("updateRoom", room);
      }else {
        return socket.emit('errorOccurred', 'The game Not Started');
      }
     }catch (e) {
      console.log(e);
     }

   });

   socket.on('gameCreatorJoin', ({nickname, roomId}) => {

    io.emit('gameCreatorListener', ({
      nickname,
      roomId,

    }));

   });

   socket.on('tap', async({index, roomId}) => {
      
    try{
    let room = await Room.findById(roomId);

    let choice = room.turn.playerType; // x or o
    if(room.turnIndex == 0) {
      room.turn = room.players[1];
      room.turnIndex = 1;
    }else {
      room.turn = room.players[0];
      room.turnIndex = 0;
    }
    room = await room.save();
    io.to(roomId).emit('tapped', {
      index,
      choice,
      room,
    })

    }catch (e) {

    }

   });

   socket.on('winner', async({winnerSocketId, roomId}) => {
    try{
      let room = await Room.findById(roomId);
     let player = room.players.find((player) => player.socketID == winnerSocketId);
     player.points += 1;
     room = await room.save();

     if(player.points >= room.maxRounds) {
     
      io.to(roomId).emit("endGame", player);
     }else{
      io.to(roomId).emit("pointIncrease", player);
     }

    }catch (e) {
      console.log(e);
    }
   });
});
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