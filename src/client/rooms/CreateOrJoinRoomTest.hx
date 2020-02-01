package client.rooms;

import js.lib.Promise;
import Config.RoomID;
import colyseus.client.Colyseus;

@:tink class CreateOrJoinRoomTest { 

    var client:Client = _;
    @:forward(
        listen,
        onJoin,
        onStateChange,
        onMessage,
        send
    )
    var currentRoom:Room;
    
    public function new()
		create()
			.then(_ -> create())
			.then(_ -> create())
			.then(_ -> getAvailableRooms())
			.then(rooms -> trace(rooms));
    

    function addListeners(room:Room) {
        room.onLeave.add(function(arguments) {
            trace("LEFT ROOM", arguments);
        });

        room.onStateChange.add(function(data) {
            trace("chat update: ", data);
        });
    }

    function join () {
		client.join(RoomID.CREATE_OR_JOIN).then(room -> {
			currentRoom = room;
			addListeners(currentRoom);
		});
    }

    function create ():Promise<Dynamic> {
       return client.create(RoomID.CREATE_OR_JOIN, { create: true }).then(room -> {
			currentRoom = room;
			addListeners(currentRoom);
		});
    }

    function joinByLastId () {
		client.join(currentRoom.id).then(room -> {
			currentRoom = room;
			addListeners(currentRoom);
		});
    }

    function getAvailableRooms() {
        return client.getAvailableRooms(RoomID.CREATE_OR_JOIN);
    }
}