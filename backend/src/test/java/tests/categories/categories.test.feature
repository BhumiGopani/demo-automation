Feature: Test the jokes categories of the database

  Scenario: Verify user is able to get all the categories of chucknorris's jokes
    # Get categories_data
    * def categories_data = call read('classpath:actions/categories/get_all_categories.action.feature')
    * def length_category = categories_data.length_category

  Scenario: Verify the freetext search categories contains the query string in output json
    # Get categories_data
    * def categories_data = call read('classpath:actions/categories/get_all_categories.action.feature')
    * def random_category = categories_data.random_category
    # Get detailed category data
    * def categories_data = call read('classpath:actions/categories/get_category_details.action.feature') {random_category: #(random_category)}

