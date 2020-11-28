Feature: Get Performance within specif days

  # Things needed for this API to work:
  # - access_token
  Scenario: Get Performance for a user within specific days
    Given url baseurl + '/v1/performance/'
    * header Content-Type = 'application/json'
    * header Authorization = 'Bearer ' + access_token
    * param start_date = '2020-02-18'
    * param end_date = '2020-03-18'
    And method get
    Then status 200
    * assert response.overall != null
    * assert response.processed != null
    * assert response.teamOverall != null
    * assert response.teamProcessed != null
    * def overall = response.overall
    * def processed = response.processed
    * def team_overall = response.teamOverall
    * def team_processed = response.teamProcessed
    * karate.log("overall performance is:", overall)
    * karate.log("processed performance is:", processed)
    * karate.log("teamOverall performance is:", team_overall)
    * karate.log("teamProcessed performance is:", team_processed)

# Extracted data of this API
# - overall
# - processed
# - team_overall
# - team_processed
