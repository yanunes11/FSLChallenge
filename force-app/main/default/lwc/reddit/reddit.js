import { LightningElement } from 'lwc';
import redditQuery from '@salesforce/apex/RedditQueries.retrieveReddit';

const columns = [
    { label: 'Title', fieldName: 'title' },
    { label: 'Full Name', fieldName: 'fullName'},
    { label: 'Thumbnail ', fieldName: 'thumbnail', type: 'url' },
    { label: 'SelfText', fieldName: 'selfText'},
];

export default class Reddit extends LightningElement {
    data = [];
    columns = columns;


    connectedCallback() {
        const data1 = redditQuery({ numberOfRecords: 40 })
        .then(response => {
            console.log('YNASC 2: '+JSON.stringify(response[0].Title__c));
        });
    }


    
}