package;
import server.rooms.*;
import colyseus.server.Server;
import js.node.Http;
import Config;

class MainServer {
	static function main() {
		// Attach WebSocket Server on HTTP Server.
		var gameServer = new Server({
			server:Http.createServer()
		});

		// Register ChatRoom as "chat"
		gameServer.define(RoomID.CHAT, ChatRoom);

		// Register ChatRoom with initial options, as "chat_with_options"
		// onInit(options) will receive client join options + options registered here.
		gameServer.define(RoomID.CHAT_WITH_OPTIONS, ChatRoom, {
			custom_options: "you can use me on Room#onInit"
		});

		// Register StateHandlerRoom as "state_handler"
		gameServer.define(RoomID.STATE_HANDLER, StateHandlerRoom);

		// Register StateHandlerRoom as "state_handler"
		gameServer.define(RoomID.AUTH, AuthRoom);

		// Register CreateOrJoin as "create_or_join"
		gameServer.define(RoomID.CREATE_OR_JOIN, CreateOrJoinRoom).filterBy(["create"]);

		gameServer.onShutdown(function() {
			trace('game server is going down.');
			return cast null;
		});

		gameServer.listen(Config.PORT);
		
		trace('-- listening on 0.0.0.0:${Config.PORT}... --');
	}
}