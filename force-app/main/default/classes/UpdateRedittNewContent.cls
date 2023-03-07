public with sharing class UpdateRedittNewContent implements Schedulable {

    public static String CRON_EXP = '0 0 1 * * ?';
    public void execute(SchedulableContext ctx) {
        TestRest.getRedittContent();
    }
}