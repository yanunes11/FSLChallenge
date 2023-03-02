public with sharing class TestRest {
    @future(callout=true)
    public static void myRest() {
        Http httpProtocol = new Http();
        HttpRequest request = new HttpRequest();
        String endpoint = 'https://www.reddit.com/new.json';
        request.setEndPoint(endpoint);
        request.setMethod('GET');
        HttpResponse response = httpProtocol.send(request);
        Map<String, Object> result = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
        Map<String, Object> data = (Map<String, Object>)result.get('data');
        List<Object> children = (List<Object>) data.get('children');
        
        Map<String, Object> child = (Map<String, Object>) children[0];

        Map<String, Object> childData = (Map<String, Object>) child.get('data');
        System.debug('title: '+childData.get('title'));
        System.debug('author_fullname: '+childData.get('author_fullname'));
        System.debug('thumbnail: '+childData.get('thumbnail'));
        System.debug('r/aww: https://www.reddit.com'+childData.get('permalink'));
    }
}