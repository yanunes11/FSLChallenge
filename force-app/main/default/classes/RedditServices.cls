public with sharing class RedditServices {

    public static List<Reddit__c> insertReddits(List<Map<String, Object>> listReditt) {
        
        List<Reddit__c> listRedittToInsert = new List<Reddit__c>();
        for (Integer i = 0; i < listReditt.size(); i++) {
            System.debug('YNASC - listReditt['+ i +']: '+listReditt[i]);
            Reddit__c rd = new Reddit__c();
            rd.Full_Name__c = (String)listReditt[i].get('author_fullname');
            String titleMaxSize = (String)listReditt[i].get('title');
            if(titleMaxSize.length() > 254 ){
                titleMaxSize = titleMaxSize.substring(0, 254);
            }
            rd.Title__c = titleMaxSize;
            rd.Thumbnail__c = (String)listReditt[i].get('thumbnail');

            String selfTextMaxSize = (String)listReditt[i].get('selftext');
            if(selfTextMaxSize.length() > 1999 ){
                selfTextMaxSize = selfTextMaxSize.substring(0, 1999);
            }
            rd.SelfText__c = selfTextMaxSize;

            listRedittToInsert.add(rd);
        }
        insert listRedittToInsert;
        return listRedittToInsert;
    }
}