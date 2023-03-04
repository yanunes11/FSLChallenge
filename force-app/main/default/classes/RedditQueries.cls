public with sharing class RedditQueries {

    @AuraEnabled (cacheable=true)
    public static List<Reddit__c> retrieveReddit(Integer numberOfRecords) {
        List<Reddit__c> redditList = [
            SELECT Title__c, Full_Name__c, SelfText__c, Thumbnail__c, CreatedDate
            FROM Reddit__c
            ORDER BY CreatedDate DESC LIMIT :numberOfRecords
        ];
        //YNASC delete - START
        Integer totalNumberReddit = 0;
        System.debug('totalNumberReddit: '+totalNumberReddit);
        for (Reddit__c rd : redditList) {
            System.debug('rd: '+rd.CreatedDate);
            totalNumberReddit += 1;
        }
        //YNASC delete - END
        return redditList;
    }
}