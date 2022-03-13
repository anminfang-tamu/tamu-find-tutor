Feature: Sign up?
  Student wants to sign up as user
  
  Scenario Outline: student wants to be user
    Given Danny "<condition>" user
    When Danny finish signup process
    Then Danny should see "<answer>"
    
  Examples:
  | condition       | answer         |
  | is not          | success        |
  | is              | already existed |