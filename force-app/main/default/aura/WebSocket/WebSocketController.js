({
    connectSocket : function(component, event, helper) {
		helper.initSocket(component, event, helper);
	},
    sendMessage : function(component, event, helper) {
		helper.onOpen(component, event, helper);
	},
    disConnectSocket : function(component, event, helper) {
		helper.onClose(component, event, helper);
	}
})