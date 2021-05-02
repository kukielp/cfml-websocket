<!-- broadcast.cfm !-->
<cfscript>
if (CGI.REQUEST_METHOD == "POST"){

    if (!isEmpty(Form.message ?: "")){

        msg = "Message from Server (#CGI.SCRIPT_NAME#): " & Form.message;

        Application.objects.connMgrBroadcast
            .broadcast(Application.applicationName, msg);

        echo("<p>Broadcasted message from Server");
    }
}
</cfscript>

<h1>Use the following Form to Broadcast a Message</h1>
<form method="POST">
    <div>Message from Server:</div>
    <div><textarea name="message" rows="6" cols="80"></textarea></div>
    <div><button type="submit" style="padding: 1em;">Broadcast Message</button></div>
</form>