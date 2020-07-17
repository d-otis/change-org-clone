require 'rails_helper'

RSpec.describe Category, type: :model do
  context "validations" do
    it "responds to title" do
      expect(Category.new).to respond_to(:title)
    end

    it "is invalid without a title" do
      expect(Category.new).to be_invalid
    end
  end

  context "re: Petitions" do

    let(:education_issues) {
      Category.create(
        :title => "Education Issues"
      )
    }

    let(:trez) {
      User.create(
        :name => "Trent Reznor",
        :password => "closer",
        :password_confirmation => "closer",
        :email => "trez@nin.com",
        :created_with_oauth => false
      )
    }

    let!(:first_petition) {
       Petition.create!(
        :title => "First Title",
        :description => "Maecenas faucibus mollis interdum. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Vestibulum id ligula porta felis euismod semper. Nulla vitae elit libero, a pharetra augue. Cras mattis consectetur purus sit amet fermentum. Nullam id dolor id nibh ultricies vehicula ut id elit.",
        :goal => 10,
        :author_id => trez.id,
        :category_id => education_issues.id
      )
    }

    let!(:second_petition) {
       Petition.create!(
        :title => "Second Title",
        :description => "Maecenas faucibus mollis interdum.",
        :goal => 15,
        :author_id => trez.id,
        :category_id => education_issues.id
      )
    }

    it "has many petitions" do
      expect(education_issues.petitions.count).to eq(2)
    end
  end
end
