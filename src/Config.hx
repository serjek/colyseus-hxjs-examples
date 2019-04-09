class Config {
    public static inline var PORT:Int = 2567;
}

@:enum abstract RoomID(String) from String to String {
    var CHAT = 'chat';
    var CHAT_WITH_OPTIONS = 'chat_with_options';
    var STATE_HANDLER = 'state_handler';
    var AUTH = 'auth';
    var CREATE_OR_JOIN = 'create_or_join';
}