package server.rooms;
import js.node.vm.Script;
import colyseus.server.Room;
import colyseus.server.schema.Schema;

class StateHandlerRoom extends Room {

    var myState:State;

    override function onCreate (options:Dynamic) {
        trace("StateHandlerRoom created!", options);
        myState = new State();
        setState(myState);
    }

    override function onJoin (client, ?options:Dynamic, ?auth:Dynamic) {
        myState.createPlayer(client.sessionId);
        return null;
    }

    override function onLeave (client, ?consented:Bool) {
        myState.removePlayer(client.sessionId);
        return null;
    }

   override function onMessage (client, data:Dynamic) {
        trace("StateHandlerRoom received message from", client.sessionId, ":", data);
        myState.movePlayer(client.sessionId, data);
    }

    override function onDispose () {
        trace("Dispose StateHandlerRoom");
        return null;
    }
}

class Player extends Schema implements ISchema {
    @:type(NUMBER)
    public var x:Float; 

    @:type(NUMBER)
    public var y:Float;

    public function new() {
        x = Math.floor(Math.random() * 400);
        y = Math.floor(Math.random() * 400);
    }
}

class State extends Schema implements ISchema {
    @:type({map: Player})
    public var players:MapSchema<Player>;

    public var something:String = "This attribute won't be sent to the client-side";

    public function new() {
        players = new MapSchema<Player>();
    }

    public function createPlayer(id: String) {
        players.set(id, new Player());
    }

    public function removePlayer (id: String) {
        players.delete(id);
    }

    public function movePlayer (id: String, movement: Point) {
        if (movement.x != null) {
            players.get(id).x += movement.x * 10;
        }
        if (movement.y != null) {
            players.get(id).y += movement.y * 10;
        }
    }
}

typedef Point = {x:Int, y:Int};