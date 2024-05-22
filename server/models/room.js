const mongoose = require('mongoose');
const playerSchema = require('./player');

const roomSchema = new mongoose.Schema({
    occupancy: {
        type: Number,
        deault: 2,
    },
    maxRounds: {
      type: Number,
      default: 6,
    },
    currentRount: {
        required: true,
        type: Number,
        default: 1,
    },
    players: [playerSchema],
    isJoin: {
        type: Boolean,
        default: true,
    },
    turn: playerSchema,
    turnIndex: {
        type: Number,
        default: 0,
    },
});

const roomModle = mongoose.model('Room', roomSchema);
module.exports = roomModle;