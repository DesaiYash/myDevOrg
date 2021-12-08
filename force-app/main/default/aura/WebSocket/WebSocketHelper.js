({
	initSocket : function(component, event, helper) {
		var wsUri = "wss://echo.websocket.org/";
        var websocket = new WebSocket(wsUri);
        
        websocket.onopen = function(evt) {
            component.set("v.isConnected", true);
        	var responseArr = component.get("v.responseMsg");
            responseArr.push("Conected");
            component.set("v.responseMsg", responseArr);
        };
        websocket.onclose = function(evt) { component.set("v.isConnected", false); };
        websocket.onmessage = function(message) { 
        	var responseArr = component.get("v.responseMsg");
            responseArr.push("Response : "+message.data);
            component.set("v.responseMsg", responseArr);
        };
        websocket.onerror = function(evt) { 
        	var responseArr = component.get("v.responseMsg");
            responseArr.push("Error : "+JSON.stringify(evt));
            component.set("v.responseMsg", responseArr);
        };
        component.set("v.webSocketObj", websocket);
	},
    
    onOpen : function(component) {        
        var websocket = component.get("v.webSocketObj");
        try {
        	websocket.send(component.get("v.message"));    
        }catch(e) {
            alert(e);
        }
        
    },
    
    onClose : function(component) {
        var responseArr = component.get("v.responseMsg");
        responseArr.push("Closed");
        component.set("v.responseMsg", responseArr);
        var websocket = component.get("v.webSocketObj");
        websocket.close();
    }
    
})