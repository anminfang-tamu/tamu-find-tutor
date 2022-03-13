Feature: Is user existing?
  User wants to edit profile
  
  Scenario Outline: User can or can not edit profile
    Given user is "<user>"
    When user wants to edit profile
    Then the user should be "<answer>"
    
  Examples:
  | user          | answer |
  | Danny         | Yes    |
  | Alex          | Yes    |
  | Others        | Nope   |