// This file to execute any test in feature file.

package features.stories;

import com.intuit.karate.junit5.Karate;

class testRunner {
    @Karate.Test
    Karate testAll() {
        return Karate.run().relativeTo(getClass());
    }
}
