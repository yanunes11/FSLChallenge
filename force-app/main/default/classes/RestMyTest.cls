@Istest
public with sharing class RestMyTest {

    @Istest
    public static void getRedittContentTest() {

        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('RedditJson');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
        // Associate the callout with a mock response
        Test.setMock(HttpCalloutMock.class, mock);
        
        Test.startTest();
        TestRest.getRedittContent();
        Test.stopTest();
        
        List<Reddit__c> rd = [SELECT Id FROM Reddit__c];
        System.assert(rd.size() > 0, 'No Reddit contect was retrieved');

    }
}