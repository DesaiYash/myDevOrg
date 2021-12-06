import { LightningElement, api, wire, track } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';

export default class HelloWorldLWC extends LightningElement {
    @track greetings;
    @api recordId;
    
    @wire(getRecord, { recordId: '$recordId', fields: [ 'Question_Master__c.Name' ] } )
    getRecordName ({error, data}) {
        if (error) {
            alert("Error "+ JSON.stringify(error));
        } else if (data) {
            this.greetings = data.fields.Name.value;            
        }
    };

    connectedCallback() {
        //this.greetings = this.recordId;
    }

    errorCallback(error, stack) {
        
    }

    
}