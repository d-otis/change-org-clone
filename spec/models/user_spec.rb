require 'rails_helper'

RSpec.describe User, type: :model do

	let(:valid_attributes) do {
		name: "Trent Reznor",
		email: "treznor@gmail.com",
		password: "1234",
		password_confirmation: "1234"
	}
	end

	context "when created via sign up form" do


		let(:missing_name) { valid_attributes.except(:name) }
		let(:missing_email) { valid_attributes.except(:email) }
		let(:missing_password) { valid_attributes.except(:password) }
		let(:missing_password_confirmation) { valid_attributes.except(:password_confirmation) }
		let(:password_mismatch) { valid_attributes.merge( { :password_confirmation => '0000' } ) }

		it 'has a password field' do
			expect(User.new).to respond_to(:password)
		end

		it "has a password confirmation field" do
			expect(User.new).to respond_to(:password_confirmation)
		end

		it "has a name field" do
			expect(User.new).to respond_to(:name)
		end

		it "has an email field" do
			expect(User.new).to respond_to(:email)
		end

		it "is valid with name, password, confirmation, and email" do
			expect(User.new(valid_attributes)).to be_valid
		end

		it "is invalid without a name" do
			expect(User.new(missing_name)).to be_invalid
		end

		it "is invalid without an email" do
			expect(User.new(missing_email)).to be_invalid
		end

		it "created_with_oauth defaults to false" do
			expect(User.new(valid_attributes).created_with_oauth).to be false
		end

		it "is invalid when password and confirmation do not match" do
			expect(User.new(password_mismatch)).to be_invalid
		end
	end

	describe "authenticate" do
		it "returns the user if the credentials match" do
			user = User.new
			user.password = '1234'
			expect(user.authenticate('1234')).to eq(user)
		end

		it "returns falsey if credentials don't match" do
			user = User.new
			user.password = '1234'
			expect(user.authenticate('0000')).to be_falsey
		end
	end

	context "when created with OAuth" do

		let(:oauth_user) { valid_attributes.merge( :created_with_oauth => true ) }
		
		it "is valid without password_confirmation" do
			expect(User.new(oauth_user)).to be_valid
		end
	end

	context "creating petitions" do

	end
end
