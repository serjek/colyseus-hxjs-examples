package;
import colyseus.client.Colyseus;
import client.rooms.*;
import Config;

class MainClient {

	static function main() {
        var client = new Client('ws://0.0.0.0:${Config.PORT}');
        new ChatRoomTest(client);
	}
}