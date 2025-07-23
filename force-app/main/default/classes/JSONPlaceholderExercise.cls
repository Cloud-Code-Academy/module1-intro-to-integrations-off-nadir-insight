public class JSONPlaceholderExercise {
    private static final String BASE_URL = 'https://jsonplaceholder.typicode.com';
    
    /**
     * Exercise 1: Implement a GET request to fetch a post by ID
     * Endpoint: /posts/{postId}
     * @param postId - The ID of the post to fetch
     * @return String - The JSON response from the API
     */
    public static String getPostById(Integer postId) {
        HttpRequest request = new HttpRequest();
        request.setEndpoint(BASE_URL + '/posts/' + postId);
        request.setMethod('GET');
        Http http = new Http();
        
        HttpResponse response;
        
        try {
            response = http.send(request);
            Integer statusCode = response.getStatusCode();
            if (statusCode >= 200 && statusCode < 300) {
                return response.getBody();
            } else {
                return 'Error: Status Code ' + statusCode + ', Response Body: ' + response.getBody();
            }
            
        } catch (CalloutException ex) {
            return 'Callout Exception: ' + ex.getMessage();
        }
    }
    
    /**
     * Exercise 2: Implement a POST request to create a new post
     * Endpoint: /posts
     * @param title - The title of the post
     * @param body - The body content of the post
     * @param userId - The user ID creating the post
     * @return String - The JSON response from the API
     */
    public static String createPost(String title, String body, Integer userId) {
        HttpRequest request = new HttpRequest();
        request.setEndpoint(BASE_URL + '/posts');
        request.setMethod('PUT');
        
        Map<String, Object> jsonMap = new Map<String, Object>{
            'title' => title,
            'body' => body
        };
        String jsonBody = JSON.serialize(jsonMap);
        
        request.setBody(jsonBody);

        Http http = new Http();
        HttpResponse response;

        try {
            response = http.send(request);
            Integer statusCode = response.getStatusCode();
            if (statusCode >= 200 && statusCode < 300) {
                return response.getBody();
            } else {
                return 'Error: Status Code ' + statusCode + ', Response Body: ' + response.getBody();
            }
        } catch (CalloutException ex) {
            return 'Callout Exception: ' + ex.getMessage();
        }

    }
    
    /**
     * Exercise 3: Implement a PUT request to update a post
     * Endpoint: /posts/{postId}
     * @param postId - The ID of the post to update
     * @param title - The new title
     * @param body - The new body content
     * @param userId - The user ID
     * @return String - The JSON response from the API
     */
    public static String updatePost(Integer postId, String title, String body, Integer userId) {
        HttpRequest request = new HttpRequest();
        request.setEndpoint(BASE_URL + '/posts/' + postId);
        request.setMethod('PUT');
        
        Map<String, Object> jsonMap = new Map<String, Object>{
            'title' => title,
            'body' => body,
            'userId' => userId
        };
        String jsonBody = JSON.serialize(jsonMap);
        
        request.setBody(jsonBody);

        Http http = new Http();
        HttpResponse response;

        try {
            response = http.send(request);
            Integer statusCode = response.getStatusCode();
            if (statusCode >= 200 && statusCode < 300) {
                return response.getBody();
            } else {
                return 'Error: Status Code ' + statusCode + ', Response Body: ' + response.getBody();
            }
        } catch (CalloutException ex) {
            return 'Callout Exception: ' + ex.getMessage();            
        }
    }
    
    /**
     * Exercise 4: Implement a PATCH request to partially update a post
     * Endpoint: /posts/{postId}
     * @param postId - The ID of the post to patch
     * @param title - The new title (can be null)
     * @return String - The JSON response from the API
     */
    public static String patchPostTitle(Integer postId, String title) {
        HttpRequest request = new HttpRequest();
        request.setEndpoint(BASE_URL + '/posts/' + postId);
        request.setMethod('PATCH');
        
        Map<String, Object> jsonMap = new Map<String, Object>{
            'title' => title
        };

        String jsonBody = JSON.serialize(jsonMap);
        request.setBody(jsonBody);

        Http http = new Http();
        HttpResponse response;
        
        try {
            response = http.send(request);
            Integer statusCode = response.getStatusCode();
            if (statusCode >= 200 && statusCode < 300) {
                return response.getBody();
            } else {
                return 'Error: Status Code ' + statusCode + ', Response Body: ' + response.getBody();
            }
        } catch (CalloutException ex) {
            return 'Callout Exception: ' + ex.getMessage();
        }
    }
    
    /**
     * Exercise 5: Implement a DELETE request to remove a post
     * Endpoint: /posts/{postId}
     * @param postId - The ID of the post to delete
     * @return Integer - The HTTP status code from the response
     */
    public static Integer deletePost(Integer postId) {
        HttpRequest request = new HttpRequest();
        request.setEndpoint(BASE_URL + '/posts/' + postId);
        request.setMethod('DELETE');

        Http http = new Http();
        HttpResponse response = http.send(request);
        return response.getStatusCode();
    }
} 