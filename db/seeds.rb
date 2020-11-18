# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Category.destroy_all

def mega_seed(users, signatures)
  puts ""
  puts "Beginning Seed..."
  puts ""

  make_categories
  make_users(users)
  make_petitions
  make_signatures(signatures)
end


def make_users(num)
  num.times do
    u = User.create(
      :name => Faker::Name.unique.name,
      :email => Faker::Internet.unique.email,
      :password => pwd,
      :password_confirmation => pwd)
    puts "#{u.id}. #{u.name} has joined"
  end

  puts ""
  puts "Created #{num} users..."
  puts ""
end

def make_petitions
  randomized_users = (User.all.map{|u| u.id}).sort{ rand() - 0.5 }
  randomized_users.each do |p|
    rand(0..3).times do
      Petition.create(
        :title => Faker::Lorem.sentence(word_count: rand(5..11)), 
        :description => LoremIpsumText::multiple_para(rand(10..30)).join("\r\n\r\n"),
        :author_id => p,
        :category_id => rand(Category.first.id..Category.last.id), 
        :goal => rand(12..20))
    end
  end

  puts ""
  puts "Created #{Petition.count} petitions..."
  puts ""
end



def make_signatures(num)

  num.times do
    petition = Petition.find(rand(Petition.first.id..Petition.last.id))
    # Need to randomly select a user and only make signature join if their user object is already in the join
    user = User.find(rand(User.first.id..User.last.id))
    # query DB for Signature where user_id and petition_id
    if Signature.where(petition: petition, user: user).empty?
      petition.signatures.create(
        :user => user, 
        :message => Faker::Lorem.sentences(number: rand(3..10)).join(" "), 
        :anonymous => rand(0..1))
    end
  end

  puts ""
  puts "Created #{Signature.count} signatures..."
  puts ""
end

def make_categories
  categories = ["Racial Justice", "Economic Justice", "Human Rights", "Women's Rights", "Animals", "Politics"]
  categories.each do |cat|
    Category.create(:title => cat)
  end
end

def assign_categories
  petitions = Petition.all
  petitions.each do |p|
    p.update(category_id: rand(1..Category.count))
  end
end

# ++++++++++++++++
# +SEED VARIABLES+
# ++++++++++++++++
pwd = '1234'
num_users = 100
num_signatures = 150

mega_seed(num_users, num_signatures)

pookie = User.create(name: "Pookie McGillicutty", email: "pookie@gmail.com", password: pwd, :password_confirmation => pwd)
dan = User.create(name: "Dan Foley", email: "dan@dan-foley.biz", password: pwd, :password_confirmation => pwd)
