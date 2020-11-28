package utils;

import java.util.concurrent.ThreadLocalRandom;

public class RandomUtils {

    public static int createRandomNumber(int count) {
        int min = 0;
        int max = count;
        int random_int = ThreadLocalRandom.current().nextInt(min, max + 1);
        return random_int;
    }
}
