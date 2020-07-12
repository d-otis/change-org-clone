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

  let(:kilo_kish) {
    User.create(
      :name => "Kilo Kish",
      :email => "kilo@kilokish.com",
      :password => "1234",
      :created_with_oauth => true
    )
  }

  let(:dorian_electra) {
    User.create(
      :name => "Dorian Electra",
      :email => "dorian@dorianelectra.com",
      :password => "1234",
      :created_with_oauth => true
    )
  }

  let(:valid_attrs) do 
    {
      :author_id => peaches.id,
      :title => "First Petition Title",
      :description => "First Petition Description",
      :goal => 1
  }
   end

   let(:first_signature) {
     Signature.new(
       :message => "First Signature Message",
       :anonymous => true,
       :user_id => kilo_kish.id,
       :petition_id => valid_petition.id)
   }

   let(:second_signature) {
     Signature.new(
       :message => "second Signature Message",
       :anonymous => true,
       :user_id => dorian_electra.id,
       :petition_id => valid_petition.id)
   }

  let(:valid_petition) { Petition.new(valid_attrs) }
  let(:missing_description) { Petition.new(valid_attrs.except(:description)) }
  let(:missing_title) { Petition.new(valid_attrs.except(:title)) }
  let(:missing_goal) { Petition.new(valid_attrs.except(:goal)) }
  let(:zero_goal) { Petition.new(valid_attrs.merge(:goal => 0)) }
  let(:negative_goal) { Petition.new(valid_attrs.merge(:goal => -1)) }
  let(:float_goal) { Petition.new(valid_attrs.merge(:goal => 2.5)) }

  let(:saved_petition) do
    valid_petition.save
    valid_petition
  end

  context "model attributes" do
    it "responds to title" do
      expect(Petition.new).to respond_to(:title)
    end

    it "responds to description" do
      expect(Petition.new).to respond_to(:description)
    end

    it "responds to goal" do
      expect(Petition.new).to respond_to(:goal)
    end

    it "responds to author/author_id" do
      expect(Petition.new).to respond_to(:author)
      expect(Petition.new).to respond_to(:author_id)
    end
  end

  context "custom instance methods" do
    it "responds to #author_name" do
      saved_petition
      expect(valid_petition).to respond_to(:author_name)
    end

    it "responds to signature_count" do
      saved_petition
      expect(valid_petition).to respond_to(:signature_count)
    end

    it '#author_name returns name of petition author' do
      saved_petition
      expect(valid_petition.author_name).to eq("Peaches")
    end

    it '#goal_percent returns the percentage met of the signature goal' do
      saved_petition
      valid_petition.signatures << first_signature
      expect(valid_petition.goal_percent).to eq(100)
    end

    it '#signatures_brief returns the first 5 signatures in reverse chrono order' do
      saved_petition.signatures << first_signature
      saved_petition.signatures << second_signature
      expect(saved_petition.signatures_brief.count).to be <= 5
      expect(saved_petition.signatures_brief.first).to eq(second_signature)
    end

    it '#signatures_full returns all signatures in reverse chrono order' do
      saved_petition.signatures << first_signature
      saved_petition.signatures << second_signature
      expect(saved_petition.signatures_full.count).to eq(saved_petition.signatures.count)
      expect(saved_petition.signatures_full.last).to eq(first_signature)
    end
  end

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
    it "has many signatures and many signers" do
      saved_petition
      valid_petition.signatures << first_signature
      valid_petition.signatures << second_signature
      expect(valid_petition.signatures.count).to eq(2)
      expect(valid_petition.signers.count).to eq(2)
    end
  end
end
