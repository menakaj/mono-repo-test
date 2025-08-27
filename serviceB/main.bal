import ballerina/http;

// Create an HTTP listener on port 8081
listener http:Listener httpListener = new (8081);

// Define a service with the base path "/"
service / on httpListener {

    // Define a resource function to handle GET requests at "/"
    resource function get .() returns string {
        return "Hello from Service B!";
    }

    // Health check endpoint
    resource function get health() returns json {
        return {
            "status": "UP",
            "service": "Hello World Service B"
        };
    }

    // Personalized greeting endpoint
    resource function get hello(string? name) returns string {
        if name is string {
            return string `Hello from Service B, ${name}!`;
        }
        return "Hello from Service B!";
    }
}
