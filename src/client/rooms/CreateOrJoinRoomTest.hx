package client.rooms;

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
        client.onOpen.add(function() {
            trace("onOpen");

            create();
            create();
            create();
            haxe.Timer.delay(getAvailableRooms, 1000);
        });
    

    function addListeners(room:Room) {
        room.onJoin.add(function() {
            trace(room.id);
            trace('joined!');
        });

        room.onLeave.add(function(arguments) {
            trace("LEFT ROOM", arguments);
        });

        room.onStateChange.add(function(data) {
            trace("chat update: ", data);
        });
    }

    function join () {
        currentRoom = client.join(RoomID.CREATE_OR_JOIN);
        addListeners(currentRoom);
    }

    function create () {
        currentRoom = client.join(RoomID.CREATE_OR_JOIN, { create: true });
        addListeners(currentRoom);
    }

    function joinByLastId () {
        currentRoom = client.join(currentRoom.id);
        addListeners(currentRoom);
    }

    function getAvailableRooms() {
        client.getAvailableRooms(RoomID.CREATE_OR_JOIN, function(rooms, ?err) {
            trace(rooms);
        });
    }
}