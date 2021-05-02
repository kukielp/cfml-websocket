<!-- index.cfm !-->
<h1>WebSocket Broadcast Example</h1>

<cfscript>
    endpoint = "/ws/broadcast";

    /** the following was set up in onApplicationStart()
    Application.objects.connMgrBroadcast =
        WebsocketRegister("/ws/broadcast", new BroadcastListener()); //*/
</cfscript>

<p class="mt2m">Sever side code:
<p>
<code class="block"><cfset echo(htmlCodeFormat('
<cfscript>
    endpoint = "/ws/broadcast";

    /** the following was set up in onApplicationStart()
    Application.objects.connMgrBroadcast =
        WebsocketRegister("/ws/broadcast", new BroadcastListener()); //*/
</cfscript>
'))></code>

<cfsavecontent variable="js">
    <script type="text/javascript">
        var endpoint = "<cfset echo(endpoint)>";
        var protocol = (document.location.protocol == "https:") ? "wss://" : "ws://";
        var url = protocol + document.location.host + endpoint;

        var wsbroadcast = new WebSocket(url);

        var log = function(evt){ console.log(evt); }
        wsbroadcast.onopen    = log;
        wsbroadcast.onmessage = log;
        wsbroadcast.onerror   = log;
        wsbroadcast.onclose   = log;
    </script>
</cfsavecontent>

<cfset echo(js)>

<p class="mt2m">Below is the JavaScript code that was used to set up the <code>wsbroadcast</code> client:
<code class="block"><cfset echo(htmlCodeFormat(js))></code>

<p class="mt2m">Open Developer Tools and send a test message using the <code>wsbroadcast</code>
  object, e.g.
<p>
<code class="block">
wsbroadcast.send("Hello Lucee WebSockets at " + (new Date()).getTime());
</code>

<style>
    code   { background-color: #f0f0f0; white-space: pre-wrap; }
    .block { display: block; }
    .mt2m { margin-top: 2em; }
</style>