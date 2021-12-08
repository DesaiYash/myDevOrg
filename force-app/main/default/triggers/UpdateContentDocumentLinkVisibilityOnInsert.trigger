trigger UpdateContentDocumentLinkVisibilityOnInsert on ContentDocumentLink (before insert) {
    for(ContentDocumentLink l:Trigger.new) {
        if((l.LinkedEntityId).getsobjecttype() == Case.getSobjectType())
        	l.Visibility='AllUsers';
    }
}