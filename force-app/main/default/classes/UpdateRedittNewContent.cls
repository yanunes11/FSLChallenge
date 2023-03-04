public with sharing class UpdateRedittNewContent implements Schedulable {
    public void execute(SchedulableContext ctx) {
        TestRest.getRedittContent();
    }
}