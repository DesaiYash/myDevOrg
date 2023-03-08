import { LightningElement, track } from 'lwc';
import searchPage from './searchComponent.html';
import searchResultPage from './searchComponentResult.html';

export default class SearchComponent extends LightningElement {

    searchQuery;
    pageSearch = true;

    searchClicked() {
        //alert(this.searchQuery);
        //this.searchQuery = "hello";
        this.pageSearch = false;
    }

    goBack() {
        this.pageSearch = true;
    }

    searchChanged(event) {
        this.searchQuery = event.target.value;
    }

    //connectedCallback() {
    //    alert("con  "+this.pageSearch);
    //}

    render() {
        //alert("render    "+this.pageSearch);
        return this.pageSearch ? searchPage : searchResultPage;
    }

    /*renderedCallback() {
        alert("render CB    "+this.pageSearch);
    }

    constructor() {
        super();
        alert("constructor    "+this.pageSearch);
    }

    disconnectedCallback() {
        alert("dis    "+this.pageSearch);
    }*/
}