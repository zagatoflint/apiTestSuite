#!/usr/bin/env bash
newman run ./test_suites/Yelp_V3_e2e_test.postman_collection.json -e Yelp.postman_environment.json --bail newman