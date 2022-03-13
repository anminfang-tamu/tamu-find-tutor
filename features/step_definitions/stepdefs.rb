module UserHelper
  def is_it_user(user)
    if user == "Others" 
      "Nope"
    else
      "Yes"
    end
  end
  
  def signup_success(condition)
    if condition == 'is not'
      "success"
    else
      "already existed"
    end
  end
end

World UserHelper

# is user
Given("user is {string}") do |user_name|
  @user = user_name
end

When("user wants to edit profile") do
  @result = is_it_user(@user)
end

Then("the user should be {string}") do |expected_answer|
  expect(@result).to eq(expected_answer)
end

# signup
Given("Danny {string} user") do |condition|
  @condition = condition
end

When("Danny finish signup process") do
  @result = signup_success(@condition)
end

Then("Danny should see {string}") do |expected_answer|
  expect(@result).to eq(expected_answer)
end

