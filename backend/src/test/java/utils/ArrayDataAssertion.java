package utils;

import com.jayway.jsonpath.JsonPath;

public class ArrayDataAssertion {

    public static boolean assertArrayData(String response, String random_category){     
        String jsonString = response;
        boolean isResults = true;
        int total = JsonPath.read(jsonString, "$.total");
        for (int i = 0; i < total; i++){ 
            String values = JsonPath.read(jsonString, "$.result[" + i + "].value");
            if(
                values.toLowerCase().contains(random_category.toLowerCase())
                ){ 
                values = "";
                continue;
            }
            else
            {
                isResults = false;
                return isResults;
            }
        }
        return true;
    }
}
