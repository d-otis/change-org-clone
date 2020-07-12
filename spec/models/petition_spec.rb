require 'rails_helper'

RSpec.describe Petition, type: :model do
  let(:peaches) {
    User.create(
      :name => "Peaches",
      :email => "peaches@peachesrocks.com",
      :password => "1234",
      :created_with_oauth => true
  )
  }

  let(:valid_attrs) do 
    {
      :author_id => peaches.id,
      :title => "First Petition Title",
      :description => "First Petition Description",
      :goal => 100
  }
   end

  let(:valid_petition) { Petition.new(valid_attrs) }
  let(:missing_description) { Petition.new(valid_attrs.except(:description)) }
  let(:missing_title) { Petition.new(valid_attrs.except(:title)) }
  let(:missing_goal) { Petition.new(valid_attrs.except(:goal)) }
  let(:zero_goal) { Petition.new(valid_attrs.merge(:goal => 0)) }
  let(:negative_goal) { Petition.new(valid_attrs.merge(:goal => -1)) }
  let(:float_goal) { Petition.new(valid_attrs.merge(:goal => 2.5)) }

  context "validations" do
    it "is valid with valid attributes" do
      expect(valid_petition).to be_valid
    end

    it "is invalid without a title" do
      expect(missing_title).to be_invalid
    end

    it "is invalid without a description" do
      expect(missing_description).to be_invalid
    end

    it "is invalid without a goal" do
      expect(missing_goal).to be_invalid
    end

    it "is invalid with a signature goal less than one" do
      expect(zero_goal).to be_invalid
      expect(negative_goal).to be_invalid
    end

    it "is invalid with a floating point signature goal" do
      expect(float_goal).to be_invalid
    end
  end

  context "signatures/signers" do
    # create new user and make them signe
    # test for ActiveRecord query methods
  end
end
