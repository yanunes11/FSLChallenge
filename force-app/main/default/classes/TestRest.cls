public with sharing class TestRest {
    @future(callout=true)
    public static void getRedittContent() {
        Http httpProtocol = new Http();
        HttpRequest request = new HttpRequest();
        String endpoint = 'https://www.reddit.com/new.json';
        request.setEndPoint(endpoint);
        request.setMethod('GET');
        HttpResponse response = httpProtocol.send(request);

        Map<String, Object> result = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());

        List<Map<String, Object>> listReditt = deserializeReditt(result);
        RedditServices.insertReddits(listReditt);
    }

    public static List<Map<String, Object>> deserializeReditt(Map<String, Object> result) {
        Map<String, Object> data = (Map<String, Object>)result.get('data');
        List<Object> children = (List<Object>) data.get('children');

        List<Map<String, Object>> listReditt = new List<Map<String, Object>>();
        for (Object c : children) {
            Map<String, Object> child = (Map<String, Object>) c;
            Map<String, Object> childData = (Map<String, Object>) child.get('data');
            listReditt.add(childData);
        }
        return listReditt;
    }
}