package performance

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._

import scala.concurrent.duration._
import scala.language.postfixOps

class PerformanceSimulation extends Simulation {

  val protocol = karateProtocol(
  )

  val demoTest = scenario(scenarioName = "Verify the freetext search categories contains the query string in output json").exec(karateFeature(name = "classpath:tests/categories/categories.test.feature"))

  setUp(
    demoTest.inject(rampUsers(20) during (2 seconds)).protocols(protocol)
  )
}
