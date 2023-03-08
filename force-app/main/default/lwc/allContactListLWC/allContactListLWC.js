import { LightningElement } from 'lwc';
import getAccounts from '@salesforce/apex/AccountListControllerLt.getAllAccount';

export default class AllContactListLWC extends LightningElement {

    
    accounts = [];
    selectedAccounts = [];
    selectedIds;
    responseObjs = {};
    suggetion_api_url = "https://www.boredapi.com/api/activity";
    showSpinner = true;

    connectedCallback() {
        getAccounts().then(result => {
            this.accounts = result;
        }).catch(error => {
            alert(error);
        });
        this.showSpinner = false;
    }
    
    handleChecked(event){
        if(event.target.checked) {
            this.selectedAccounts.push(event.target.value);
        }
        else {
            this.selectedAccounts.splice(this.selectedAccounts.indexOf(event.target.value), 1);
        }
    }

    saveTheSelection() {
        this.selectedIds = this.selectedAccounts.join(', ');
    }

    getSomeSuggetions() {
        this.showSpinner = true;
        fetch(this.suggetion_api_url).then(response => {
            if(response.ok) {
                return response.json();
            } else {
                throw Error(response);
            }
        }).then(responseJson => {
            this.responseObjs = responseJson;
            this.showSpinner = false;
        }).catch(error => {
            console.log(error);
            this.showSpinner = false;
        });
    }



}