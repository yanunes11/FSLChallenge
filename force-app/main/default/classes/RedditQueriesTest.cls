@IsTest
public with sharing class RedditQueriesTest {
    @TestSetup
    public static void setup(){
        List<Reddit__c> redditList = new List<REddit__c>();

        for (Integer i = 0; i < 10; i++) {
            Reddit__c rd = new Reddit__c();
            redditList.add(rd);
        }
        insert redditList;
    }
    @IsTest
    public static void RedditQueriesTest() {
        Test.startTest();
        List<Reddit__c> redditList = RedditQueries.retrieveReddit(10);
        Test.stopTest();
        System.assert(redditList.Size() == 10, 'There is no 10 REddit Objects');
    }
}