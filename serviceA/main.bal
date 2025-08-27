import ballerina/http;

// Create an HTTP listener on port 8080
listener http:Listener httpListener = new (8080);

// Define a service with the base path "/"
service / on httpListener {

    // Define a resource function to handle GET requests at "/"
    resource function get .() returns string {
        return "Hello, World!";
    }

    // Health check endpoint
    resource function get health() returns json {
        return {
            "status": "UP",
            "service": "Hello World Service"
        };
    }

    // Personalized greeting endpoint
    resource function get hello(string? name) returns string {
        if name is string {
            return string `Hello, ${name}!`;
        }
        return "Hello, World!";
    }
}
