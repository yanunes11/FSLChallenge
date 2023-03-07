@IsTest
public with sharing class UpdateRedittNewContentTest {
    @IsTest
    public static void test() {
        Test.startTest();
        String jobId = System.schedule('testBasicScheduledApex',
        UpdateRedittNewContent.CRON_EXP, 
           new UpdateRedittNewContent());
  
        // Get the information from the CronTrigger API object
        CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, 
           NextFireTime
           FROM CronTrigger WHERE id = :jobId];
        Test.stopTest();
        System.assertEquals(UpdateRedittNewContent.CRON_EXP, 
        ct.CronExpression);
    }
}