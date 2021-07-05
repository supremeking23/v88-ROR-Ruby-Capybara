require 'rails_helper'

# build: The build method will instantiate a new instance of your model class but won't save it to the database. Not saving is usually preferred over saving because making calls to the database will make our tests run slower.

# create: Very similar to build with the exception that it saves the instance to the database.
RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context "With valid attributes" do 
    it "should save" do 
      expect(build(:user)).to be_valid
    end
  end

  context "With invalid attributes" do 
    it "should not save if first_name field is blank" do
      expect(build(:user, first_name: "")).to be_invalid
    end
    it "should not save if last_name field is blank" do
      expect(build(:user, last_name: "")).to be_invalid
    end
    it "should not save if email already exists" do
      create(:user)
      expect(build(:user)).to be_invalid
    end
    it "should not save if invalid email format" do
      expect(build(:user, email: "invalidEmail")).to be_invalid
    end
  end
end
