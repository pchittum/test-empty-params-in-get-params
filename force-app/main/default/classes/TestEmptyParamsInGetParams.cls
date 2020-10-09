public with sharing class TestEmptyParamsInGetParams {

    // this class was used purely to test how the getParameters method behaves in a 
    // "no parameter" situation in visualforce to see whether it would benefit to use
    // the new null-safe operator in Apex.SELECT 
    
    // The answer: in a no-parameter situation, getParameters appears to return an empty
    // map. Meaning no reason to use the null-safe parameter. To be more specific, the 
    // following is pointless: 
    // ApexPages.currentPage().getParameters()?.get('param-name')

    public String paramsTestOutput {get; set;}

    public TestEmptyParamsInGetParams() {
        String param = ApexPages.currentPage().getParameters().get('Blah'); // this does not throw an error when no HTTP parameters present

        Map<String,String> paramsObj = ApexPages.currentPage().getParameters(); // returns empty map when no HTTP parameters present

        paramsTestOutput = 'The param value is: ' + param + 'and the paramsObj type is map? ' + paramsObj;
        System.debug(paramsObj);
    }
}
