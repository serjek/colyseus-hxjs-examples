package server.rooms;
import colyseus.server.Room;

class ChatRoom extends Room {

	public function new() {
		super();
		maxClients = 4;
		autoDispose = false;
	}

	override function onCreate(options:Dynamic) {
		trace("ChatRoom created!", options);
		onMessage(
			"message",
			(client, data) -> {
				trace("ChatRoom received message from", client.sessionId, ":", data);
				broadcast("broadcast", '(${ client.sessionId }) $data');
			}
		);
	}

	override function onJoin(client, ?options:Dynamic) {
		broadcast("broadcast", '${ client.sessionId } joined.');
		//TODO figure out how to get rid of this
		return null;
	}

	override function onLeave(client, ?consented:Bool) {
		broadcast("broadcast", '${ client.sessionId } left.');
		return null;
	}

	override function onDispose() {
		trace("Dispose ChatRoom");
		return null;
	}
}