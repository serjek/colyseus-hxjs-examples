package rooms;
import colyseus.server.Room;
import colyseus.server.schema.Schema;

class StateHandlerRoom extends Room {

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
/*
class State extends Schema {
    @type({ map: Player })
    players = new MapSchema<Player>();

    public var something:String; = "This attribute won't be sent to the client-side";

    public function createPlayer(id: string) {
        this.players[ id ] = new Player();
    }

    removePlayer (id: string) {
        delete this.players[ id ];
    }

    movePlayer (id: string, movement: any) {
        if (movement.x) {
            this.players[ id ].x += movement.x * 10;

        } else if (movement.y) {
            this.players[ id ].y += movement.y * 10;
        }
    }
}
*/