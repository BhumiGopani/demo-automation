Feature: Get all the categories of chucknorris's jokes

  Scenario: Get all the categories
    Given url baseurl + '/jokes/categories'
    * header Content-Type = 'application/json'
    And method Get
    Then status 200
    * assert response != null
    * assert response.length != null
    * def length_category = response.length
    # Fetching number of digits in length
    * def get_num_digits = Java.type('utils.CountDigits')
    * def digits = get_num_digits.countDigit(length_category)
    # Fetching random number from  random utils to get any random Category
    * def get_random_num = Java.type('utils.RandomUtils')
    * def num = get_random_num.createRandomNumber(digits)
    * def random_category = response[num]
    * karate.log("Total Category are: ", length_category)

# Extracted data of this API
# - length_category
# - random_category