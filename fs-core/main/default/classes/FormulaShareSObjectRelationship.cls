public inherited sharing class FormulaShareSObjectRelationship {

    public String thisObjectToken;
    public String thisObjectApiName;
    public String thisObjectLabel;
    public String lookupFromPrevObjectToken;
    public String lookupFromPrevObjectApiName;
    public String lookupToPrevObjectToken;
    public String lookupToPrevObjectApiName;
    public String sharedToFieldToken;
    public String sharedToFieldApiName;
    public String sharedToFieldLabel;

    public FormulaShareSObjectRelationship nextRelationship;

    public Boolean isValid() {
        if(thisObjectApiName == null) {
            System.debug('isValid() fail: Object API name not populated for relationship: ' + this);
            return false;
        }
        if(lookupToPrevObjectApiName == null && lookupFromPrevObjectApiName == null) {
            System.debug('isValid() fail: No relationship details for relationship: ' + this);
            return false;
        }
        if(lookupToPrevObjectApiName != null && lookupFromPrevObjectApiName != null) {
            System.debug('isValid() fail: Both relationship details are populated for relationship: ' + this);
            return false;
        }
        if(sharedToFieldToken == null && nextRelationship == null) {
            System.debug('isValid() fail: No shared to field or nested relationship for relationship: ' + this);
            return false;
        }
        if(sharedToFieldToken != null && nextRelationship != null) {
            System.debug('isValid() fail: Both shared to field and nested relationship populated for relationship: ' + this);
            return false;
        }
        if(nextRelationship != null) {
            System.debug(nextRelationship);
            if(!nextRelationship.isValid()) {
                System.debug('isValid() fail: Nested relationship not valid for relationship: ');
                return false;
            }
        }
        return true;
    }

}