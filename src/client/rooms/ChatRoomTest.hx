package client.rooms;

import Config.RoomID;
import colyseus.client.Colyseus;

@:tink class ChatRoomTest { 

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
		client.joinOrCreate(RoomID.CHAT).then(room -> {
			this.room = room;
			onJoinHandler();
		});
    }
    
    function onJoinHandler() {
        trace("joined");
        listen("messages/:index", function(change) {
            trace("CHANGE!", change);
        });

        onStateChange.once(function(state) {
            trace("initial room state:", state);
        });

        // new room state
        onStateChange.add(function(state) {
            // this signal is triggered on each patch
        });

        // listen to patches coming from the server
        onMessage.add(function(message) {
            trace('> ',message);
        });

        recursiveSend();
    }

    function recursiveSend() {
        // send message to room on random timer
        send({message: getRandomMessage()});
        haxe.Timer.delay(recursiveSend, Std.int(Math.random()*1000) + 500);
    }

    function getRandomMessage() {
        var a = ["Oh", "Hello!", "Why not?", "Wonderful weather.", "Just asking", "I'm not a bot, why?", "yes", "no"];
        return a[Std.int(Math.random() * a.length)];
    }
}