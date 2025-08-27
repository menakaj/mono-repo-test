import ballerina/test;
import ballerina/http;

// Test the root endpoint
@test:Config {}
function testRootEndpoint() returns error? {
    http:Client testClient = check new ("http://localhost:8080");
    
    string response = check testClient->get("/");
    test:assertEquals(response, "Hello, World!");
}

// Test the health endpoint
@test:Config {}
function testHealthEndpoint() returns error? {
    http:Client testClient = check new ("http://localhost:8080");
    
    json response = check testClient->get("/health");
    json expectedResponse = {
        "status": "UP",
        "service": "Hello World Service"
    };
    test:assertEquals(response, expectedResponse);
}

// Test the hello endpoint without name parameter
@test:Config {}
function testHelloEndpointWithoutName() returns error? {
    http:Client testClient = check new ("http://localhost:8080");
    
    string response = check testClient->get("/hello");
    test:assertEquals(response, "Hello, World!");
}

// Test the hello endpoint with name parameter
@test:Config {}
function testHelloEndpointWithName() returns error? {
    http:Client testClient = check new ("http://localhost:8080");
    
    string response = check testClient->get("/hello?name=John");
    test:assertEquals(response, "Hello, John!");
}

// Test with special characters in name
@test:Config {}
function testHelloEndpointWithSpecialCharacters() returns error? {
    http:Client testClient = check new ("http://localhost:8080");
    
    string response = check testClient->get("/hello?name=Alice%20Smith");
    test:assertEquals(response, "Hello, Alice Smith!");
}
