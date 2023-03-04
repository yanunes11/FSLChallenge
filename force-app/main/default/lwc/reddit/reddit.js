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
        console.log('YNASC Invoked');
        // const data = redditQuery({ numberOfRecords: 40 });
        // this.data = data;
        const data1 = redditQuery({ numberOfRecords: 40 })
        .then(response => {
            console.log('YNASC: '+JSON.stringify(response));
        });
    }


    
}