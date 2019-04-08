package rooms;
import colyseus.server.Room;

class ChatRoom extends Room {

    public function new() {
		super();
		maxClients = 4;		
	}

    override function onInit (options:Dynamic) {
        trace("BasicRoom created!", options);
    }

    override function onJoin (client, ?options:Dynamic, ?auth:Dynamic) {
        broadcast('${ client.sessionId } joined.');
        return null;
    }

    override function onLeave(client, ?consented:Bool) {
        broadcast('${ client.sessionId } left.');
        return null;
    }

    override function onMessage(client, data:Dynamic) {
        trace("BasicRoom received message from", client.sessionId, ":", data);
        broadcast('(${ client.sessionId }) ${ data.message }');
    }

    override function onDispose () {
        trace("Dispose BasicRoom");
        return null;
    }
}