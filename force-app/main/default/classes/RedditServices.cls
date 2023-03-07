public with sharing class RedditServices {

    public static List<Reddit__c> insertReddits(List<Map<String, Object>> listReditt) {
        
        List<Reddit__c> listRedittToInsert = new List<Reddit__c>();
        for (Integer i = 0; i < listReditt.size(); i++) {
            Reddit__c rd = new Reddit__c();
            rd.Full_Name__c = (String)listReditt[i].get('author_fullname');
            rd.Title__c = maxSize((String)listReditt[i].get('title'), 254);
            rd.Thumbnail__c = (String)listReditt[i].get('thumbnail');
            rd.SelfText__c = maxSize((String)listReditt[i].get('selftext'), 1999);

            listRedittToInsert.add(rd);
        }
        Database.insert(listRedittToInsert, false);
        return listRedittToInsert;
    }

    //Avoid errors if exceed character quantity
    public static String maxSize(String str, Integer strLength) {
        if(str.length() > strLength ){
            str = str.substring(0, strLength);
        }
        return str;
    }
}