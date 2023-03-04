import { LightningElement } from 'lwc';
import redditQuery from '@salesforce/apex/RedditQueries.retrieveReddit';

const columns = [
    { label: 'Title', fieldName: 'Title__c', type: 'text'},
    { label: 'Full Name', fieldName: 'Full_Name__c', type: 'text'},
    { label: 'Thumbnail ', fieldName: 'SelfText__c', type: 'url' },
    { label: 'SelfText', fieldName: 'Thumbnail__c', type: 'text'},
];

export default class Reddit extends LightningElement {
    data = [];
    columns = columns;


    connectedCallback() {
        const data = redditQuery({ numberOfRecords: 40 })
        .then(response => {
            this.data = response;
        });
    }


    
}