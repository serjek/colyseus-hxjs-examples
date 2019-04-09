package server.rooms;
import colyseus.server.Room;

class ChatRoom extends Room {

    public function new() {
		super();
		maxClients = 4;		
	}

    override function onInit (options:Dynamic) {
        trace("ChatRoom created!", options);
    }

    override function onJoin (client, ?options:Dynamic, ?auth:Dynamic) {
        broadcast('${ client.sessionId } joined.');
        //TODO figure out how to get rid of this
        return null;
    }

    override function onLeave(client, ?consented:Bool) {
        broadcast('${ client.sessionId } left.');
        return null;
    }

    override function onMessage(client, data:Dynamic) {
        trace("ChatRoom received message from", client.sessionId, ":", data);
        broadcast('(${ client.sessionId }) ${ data.message }');
    }

    override function onDispose () {
        trace("Dispose ChatRoom");
        return null;
    }
}