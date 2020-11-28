# Brief about Repo
Demo of automation framework for UI and API testing. 

# Framework Organization
```
├── README.md
├── .gitignore
├── .pre-commit-config.yaml
├── backend
│   ├── run-in-docker.sh    - Docker file for running the API tests
│   ├── run-in-docker-performance.sh    - Docker file for running the API tests
│   ├── pom.xml             - All the dependency are mentioned in it
│   ├── src/test/java       - Tests folder
│       └── actions         - All the reusuable actions are mentioned in this folder
│       └── performance     - Necessary code to run the performance tests of API
│       └── tests           - API tests
│       └── utils           - Resuabale java code is mentioned in the folder
│       └── karate-config.js- Karate config file which can be overriden by run-in-docker.sh file
├── frontend
│   ├── run-in-docker.sh    - Docker file for running the API tests
│   ├── prepare.sh          - Execute in case you dont have chromedriver in speific path
│   ├── requirement.txt     - All the dependency are mentioned in it
│   ├── web                 - Tests folder
│       └── resources       - Chromedriver to set a path
│       └── tests           - Test folder
│       └── variables.robot - Config file to set the parameters`
```

### Using Docker

1. [Install Docker](https://docs.docker.com/docker-for-mac/install/)
2. Backend Tests: `cd backend && ./run-in-docker.sh`
3. Frontend Tests: `cd frontend && ./run-in-docker.sh`
3. Performance Tests: `cd frontend && ./run-in-docker-performance.sh`


### Frontend tests

- By default `browser:headlesschrome`is used as the browser to run the tests, you can [read the documentation](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html#Open%20Browser)
to see what other options you can use. 
- To run the frontend test use the command :
1. `./run-tests.sh frontend`.
2. `cd frontend` and `./run-in-docker.sh`
3. `robot -d results tests/`
- We are using `ppodgorsek/robot-framework:latest` image for running the tests, we can configure all the options to run the tests in run-in-docker.sh file in frontend directory.
- All the test results can be seen under `results` directory after execution finishes.
- All the configurations settings can be modified from any of the .sh file like browser. Test Suites is working for following browsers:
1. headlesschrome
2. chrome
3. firefox
Please chnage the settings to execute tests.
- If chromedriver is not present in your system or path is not set, please execute `./prepare.sh` file, it is assumed that you dont have even chromedriver installed.
- For executing tests in parallel we are already using inbuilt pabot, you can chnage the number of threads by modifying ROBOT_THREADS in run-in-docker.sh

### Backend tests

- Technology used - Karate API BDD
- To run the backend test you can use any of the following command:
1. `./run-tests.sh backend`
2. `cd backend` and `./run-in-docker.sh`
3. `mvn clean test`
- We are using the 'maven' image to execute the tests and all the configuration is present in run-in-docker.sh file in backed directory.
- All the test results can be seen under `target/cucumber-html-reports` directory after execution finishes.
- If you wnat to change the env of the tests running, please modify url under run-in-docker.sh, commands are written to create karate-config.js new everytime based on mentioned configuration.

### Performance tests

To run the backend performance test use the command:
1. `cd backend` and `mvn clean test-compile gatling:test` 
2. `cd backend` and `./run-in-docker-performance.sh`

####Please note:
- Performance suite won't be executed every time we execute backend api tests, we have to explicitly run it when we want to test performance at the end of release cycle.
- Default setting for test suite is 20 users executing scenario in 2 second. You can change the number by editing "rampUsers" parameter in PerformanceSimulation.scala.
- All the test results can be seen under `target\gatling` directory after execution finishes.


### CI is done using Github Actions

- All the workflow details are under `workflows` directory

## To see the results after CI is executed.

- Navigate to Github Actions link: `https://github.com/BhumiGopani/demo-automation/actions`
- Click on artifacts to view any of the results of the executed workflow. Link is: `https://github.com/BhumiGopani/demo-automation/actions/runs/388623013`


## IDE setings for VSCode

- Setttings for the project is under .vscode folder.

## Why choose these tech stack

- Since this was very simple application I selected Karate and Robot BDD frameworks. 
- If we have high compnonents to JS in UI, offcourse autoamting with robot is going to be tough, for that we can have new ear frameworks like - Cypress, Puppeteer, Playwright etc, this can make our life super easy.
- Also for performace I have selected Galting because its easily configurable with Karate, there are other attracive options like Locust, Jmeter etc.

## What else fancy can be done in very less time

- New Visual testing like Percy, Applitools can be added for UI, which can decrese number of our UI tests and lead to less maintenance.
- Cross Browser testing with browserstack, lambdatest etc can be a good addition.

## Implemented technologies/libraries

- `Robot Framework`: [Official documentation](https://robotframework.org/)
- `Karate Framework`: [Official documentation](https://intuit.github.io/karate/)
- `Robot Framework Best Practices`: [Official documentation](https://github.com/robotframework/HowToWriteGoodTestCases/blob/master/HowToWriteGoodTestCases.rst)
- `Robot Framework Developing Guide`: [Guide](https://github.com/idumpling/robotx/blob/master/docs/ROBOT_BEST_PRACTICE.md)
- `Gatling Framework`: [Official documentation](https://intuit.github.io/karate/karate-gatling/)
- `Chromedriver path`:  [Guide] (https://www.kenst.com/2015/03/including-the-chromedriver-location-in-macos-system-path/)
