# apiTestSuite With Postman command line 
An example end-to-end test suite using tests developed in the Postman app and executing with Newman (the postman command line utility)

## Why would you need this?
Newman command line allows seamless implementation in Continuous Integration tools like Jenkins, CircleCI, TeamCity. 
This is especially useful when using the available Docker Image.

## About this example
This example suite uses Yelp as an example of an API under test.

The end-to-end test suite demos:
 
 1. Running postman scripts from commandline (newman)
 2. Using the "Tests" feature of postman to do Assertions on API responses (json in this case) 
 3. Setting environment variables dynamically based on API response data to "Chain" api requests.

# Tests in Postman

Test scripts are easily added in the Postman App:  [https://learning.getpostman.com/docs/postman/scripts/test_scripts/]()
 
The assertion library in postman is based on chaiJS: [http://chaijs.com/api/bdd/]()
 

Import this suite into postman to edit and see the tests:

    apiTestSuite/test_suites/Yelp_V3_e2e_test.postman_collection.json

How to import:

![Import Collections](https://github.com/zagatoflint/apiTestSuite/blob/master/Docs/importPostmanCollection.gif?raw=true "Import")


Here is a partial snippet of a test in postman:

   
    //The following assertions validate the existance of json tag in the response
    
       var jsonData = pm.response.json();
       tests["Response has alias"] = jsonData.businesses[0].alias !== undefined;
       tests["Response has phone"] = jsonData.businesses[0].phone !== undefined;
    
    //The followsing two lines set environment variables that will be used by the next test in the coillection 
    
       pm.environment.set("biz_alias", jsonData.businesses[0].alias);
       pm.environment.set("biz_phone", jsonData.businesses[0].phone);


## Running the suite:

# Get a Yelp API key
You will need to get a Yelp apikey to run this example, signup for one from here:
https://www.yelp.com/developers/documentation/v3/authentication

Update this environment file with your apikey: 


    Yelp.postman_environment.json

Replace _"YOUR_YELP_DEVELOPER_KEY"_ with your yelp apikey.

## Running the collection from within postman:

You can execute the collection from within postman to debug.

The docs are here: [https://learning.getpostman.com/docs/postman/collection_runs/starting_a_collection_run/]()
 

## Running from command line

### Install newman

You can run newman from docker as documented: [https://blog.getpostman.com/2015/08/07/using-the-newman-docker-image-in-windows/]()
(Helpful if you are running on Windows)

Or install via npm and run natively as documented: [https://learning.getpostman.com/docs/postman/collection_runs/command_line_integration_with_newman/#___gatsby]()


Once newman is installed execute the following script to run the suite:

    ./runTest.sh


####Reference Documentation

[https://learning.getpostman.com/docs/postman/collection_runs/starting_a_collection_run/]()

[http://chaijs.com/api/bdd/]()

[https://learning.getpostman.com/docs/postman/scripts/test_scripts/]()

[https://blog.getpostman.com/2015/08/07/using-the-newman-docker-image-in-windows/]()

[https://learning.getpostman.com/docs/postman/collection_runs/command_line_integration_with_newman/#___gatsby]()


