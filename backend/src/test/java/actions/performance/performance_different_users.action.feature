Feature: Get Performance for unauthorized user

  Scenario: Get Performance for a user
    Given url baseurl + '/v1/performance/'
    * header Content-Type = 'application/json'
    And method get
    Then status 401
    * assert response.detail != null
    * def detail_error_message = response.detail
    * karate.log("Error message is:", detail_error_message)

# Extracted data of this API
# - detail_error_message
