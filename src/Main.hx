package;
import rooms.*;
import colyseus.server.Server;
import js.node.Http;

class Main {
	static inline var PORT:Int = 2567;

	static function main() {
		// Attach WebSocket Server on HTTP Server.
		var gameServer = new Server({
			server:Http.createServer()
		});

		// Register ChatRoom as "chat"
		gameServer.register("chat", ChatRoom);

		// Register ChatRoom with initial options, as "chat_with_options"
		// onInit(options) will receive client join options + options registered here.
		gameServer.register("chat_with_options", ChatRoom, {
			custom_options: "you can use me on Room#onInit"
		});

		// Register StateHandlerRoom as "state_handler"
		gameServer.register("state_handler", StateHandlerRoom);

		// Register StateHandlerRoom as "state_handler"
		gameServer.register("auth", AuthRoom);

		// Register CreateOrJoin as "create_or_join"
		gameServer.register("create_or_join", CreateOrJoinRoom);

		gameServer.onShutdown(function() {
			trace('game server is going down.');
			return cast null;
		});

		gameServer.listen(PORT);
		
		trace('-- listening on 0.0.0.0:$PORT... --');
	}
}


/*
class MatchState extends Schema implements ISchema {

	@:type(NUMBER)
	public var someProp:Float;

	@:type(STRING)
	public var foo:String;

    public function new(){
        someProp = 88.99;
        foo = "hey man!";
    }
}

class MatchRoom extends Room {

	public function new() {
		super();
		maxClients = 4;		
	}

	override function onInit(options:Dynamic):Void {
		trace('MATCH with options $options');
        this.setState(new MatchState());
		haxe.Timer.delay(function() {
			state.someProp += 20;
			state.foo = "baz";
		}, 2000);
	};

    override function onJoin(client:Client, ?options:Dynamic, ?auth:Dynamic) {
        trace('MATCH join ${client.id} ${client.options} ${options}');
        trace([for (c in clients) c.id]);
        setMetadata(options);
        return cast null;
    };

}
*/