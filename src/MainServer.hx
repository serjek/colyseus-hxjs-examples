package;
import server.rooms.*;
import colyseus.server.Express;
import colyseus.server.Colyseus.defineServer;
import colyseus.server.Colyseus.defineRoom;
import colyseus.server.Colyseus.monitor;
import colyseus.server.Colyseus.playground;
import js.node.Http;
import Config;

class MainServer {
	static function main() {
		// Attach WebSocket Server on HTTP Server.
		var serverDef = defineServer({
			devMode: true,
			rooms: {
				CHAT: defineRoom(ChatRoom),
				CHAT_WITH_OPTIONS: defineRoom(ChatRoom, {
					custom_options: "you can use me on Room#onInit"
				}).filterBy(["create"]),
				STATE_HANDLER: defineRoom(StateHandlerRoom),
				VIEW_ROOM: defineRoom(ViewRoom),
				NOT_ALLOWED: defineRoom(NotAllowedRoom)
			},
			express: (app) -> {
				app.get("/hi", (req, res) -> {
					res.send("It's time to kick ass and chew bubblegum!");
				});
				app.use(
					"/monitor", 
					ExpressAuth.create({
						users: {
							"admin": "admin"
						},
						challenge: true
					}),
					monitor()
				);
				app.use("/", playground());
			}
		});

		serverDef.onShutdown(function() {
			trace('game server is going down.');
			return null;
		});

		serverDef.listen(Config.PORT);
		
		trace('-- listening on 0.0.0.0:${Config.PORT}... --');
	}
}