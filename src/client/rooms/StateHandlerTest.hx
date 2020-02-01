package client.rooms;

import Config.RoomID;
import colyseus.client.Colyseus;

@:tink class StateHandlerTest { 

    var client:Client = _;
    @:forward(
        listen,
        onJoin,
        onStateChange,
        onMessage,
        send
    )
    var room:Room;
    
    public function new() {
		client.joinOrCreate(RoomID.STATE_HANDLER).then(room -> {
			this.room = room;
			onJoinHandler();
		});
    }
    
    function onJoinHandler() {
        // listen to patches coming from the server
        onStateChange.once(function(state) {
            trace("initial room state:", state);

            room.state.players.onAdd = function(player, sessionId) {
                trace('player added with followind data: ${playerToString(player)}');
            }

            room.state.players.onRemove = function(player, sessionId) {
                trace('player removed: ${playerToString(player)}');
            }

            room.state.players.onChange = function (player, sessionId) {
                trace('player patched: ${playerToString(player)}');
            }
        });
        
        recurrentMove();
    }

    function playerToString(player):String 
        return 'x = ${player.x}, y = ${player.y}';

    function recurrentMove() {
        haxe.Timer.delay(recurrentMove, 1000);
        var action = Std.int(Math.random() * 4);
        switch(action) {
            case 0: up();
            case 1: down();
            case 2: left();
            case 3: right();
            default: 
        }
    }

    function up () {
        room.send({ y: -1 });
    }

    function right () {
        room.send({ x: 1 });
    }

    function down () {
        room.send({ y: 1 });
    }

    function left () {
        room.send({ x: -1 });
    }
}