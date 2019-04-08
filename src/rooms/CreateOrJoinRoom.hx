package rooms;
import colyseus.server.Room;

class CreateOrJoinRoom extends Room {
    public function new() {
		super();
		maxClients = 4;		
	}

    override function onInit (options:Dynamic)
        trace("CREATING NEW ROOM");

    override function onJoin (client, ?options:Dynamic, ?auth:Dynamic) {
       trace("JOINING ROOM");
       return null;
    }

    override function onLeave(client, ?consented:Bool) {
        trace("ChatRoom:", client.sessionId, "left!");
        return null;
    }

    override function requestJoin (options:Dynamic, ?isNew:Bool)
        return (options.create)
            ? (options.create && isNew)
            : clients.length > 0;
}