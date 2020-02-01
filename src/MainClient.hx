package;
import colyseus.client.Colyseus;
import client.rooms.*;
import Config;

class MainClient {

	static function main() {
        var client = new Client('ws://0.0.0.0:${Config.PORT}');
		//uncomment following tests one by one to get the idea of how it works ;)
		//new ChatRoomTest(client);
        //new CreateOrJoinRoomTest(client);
        new StateHandlerTest(client);
	}
}