class Config {
	public static inline var PORT:Int = 2567;
}

enum abstract RoomID(String) {
	var CHAT;
	var CHAT_WITH_OPTIONS;
	var STATE_HANDLER;
	var AUTH;
	var NOT_ALLOWED;
}