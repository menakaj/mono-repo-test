import ballerina/test;
import ballerina/http;

// Test the root endpoint
@test:Config {}
function testRootEndpoint() returns error? {
    http:Client testClient = check new ("http://localhost:8081");
    
    string response = check testClient->get("/");
    test:assertEquals(response, "Hello from Service B!");
}

// Test the health endpoint
@test:Config {}
function testHealthEndpoint() returns error? {
    http:Client testClient = check new ("http://localhost:8081");
    
    json response = check testClient->get("/health");
    json expectedResponse = {
        "status": "UP",
        "service": "Hello World Service B"
    };
    test:assertEquals(response, expectedResponse);
}

// Test the hello endpoint without name parameter
@test:Config {}
function testHelloEndpointWithoutName() returns error? {
    http:Client testClient = check new ("http://localhost:8081");
    
    string response = check testClient->get("/hello");
    test:assertEquals(response, "Hello from Service B!");
}

// Test the hello endpoint with name parameter
@test:Config {}
function testHelloEndpointWithName() returns error? {
    http:Client testClient = check new ("http://localhost:8081");
    
    string response = check testClient->get("/hello?name=Jane");
    test:assertEquals(response, "Hello from Service B, Jane!");
}
