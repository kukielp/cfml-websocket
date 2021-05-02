/** Application.cfc */
component {

    this.name = "websocket_broadcast";

    function onApplicationStart(){

        Application.objects.connMgrBroadcast =
            WebsocketRegister("/ws/broadcast", new BroadcastListener());
    }
}