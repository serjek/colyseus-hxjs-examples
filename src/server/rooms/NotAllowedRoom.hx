package server.rooms;
import colyseus.server.Room;

class NotAllowedRoom extends Room {
	public function new() {
		super();
		maxClients = 4;
	}

	override function onJoin(client, ?options:Dynamic) {
		trace("JOINING ROOM");
		return new js.lib.Promise((res, rej) -> haxe.Timer.delay(() -> rej({code: 403, message:"not allowed this time"}), 2000));
	}
}