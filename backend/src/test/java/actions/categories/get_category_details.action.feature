Feature: Get detailed output of single joke category

# Things needed for this API to work:
# - random_category

  Scenario: Get one category
    * karate.log("We are getting detailed results for category: ", random_category)
    Given url baseurl + '/jokes/search?query=' + random_category
    * header Content-Type = 'application/json'
    And method Get
    Then status 200
    * karate.log("response.result.length", response.result.length)
    * assert response.total != null
    * def array_data_obj = Java.type('utils.ArrayDataAssertion')
    * def result = array_data_obj.assertArrayData(response, random_category)
    * match result == true
