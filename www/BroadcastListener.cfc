/** BroadcastListener.cfc */
component {

    this.channel = Application.applicationName;

    function onOpen(websocket, endpointConfig, sessionScope, applicationScope){

        // subscribe the incoming connection to the channel
        arguments.websocket.subscribe(this.channel);
    }

    function onMessage(websocket, message, sessionScope, applicationScope){

        var connMgr = arguments.websocket.getConnectionManager();
        var message = "Message from Client (#arguments.websocket.getId()#):" 
                          & " [#arguments.message#]";

        // broadcast the message to all subscribers of the channel
        connMgr.broadcast(this.channel, message);
    }
}