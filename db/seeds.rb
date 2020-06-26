# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ++++++++++++++++
# +SEED VARIABLES+
# ++++++++++++++++
num_users = 20
num_petitions = 50
num_signatures = 70

def mega_seed(users, petitions, signatures)
	puts ""
	puts "Beginning Seed..."
	puts ""

	make_users(users)
	make_petitions(petitions)
	make_signatures(signatures)
end


def make_users(num)
	num.times do
		u = User.create(
			:name => Faker::Name.unique.name,
			:email => Faker::Internet.unique.email,
			:password => '1234')
		puts "#{u.id}. #{u.name} has joined"
	end

	puts ""
	puts "Created #{num} users..."
	puts ""
end

def make_petitions(num)
	random_users = (1..User.count).sort{ rand() - 0.5 }

	random_users.each do |p|
		Petition.create(
			:title => Faker::Quote.unique.robin,
			:description => LoremIpsumText::multiple_para(rand(10..30)).join("\r\n\r\n"),
			:author_id => p,
			:goal => rand(12..24))
	end

	puts ""
	puts "Created #{num} petitions..."
	puts ""
end



def make_signatures(num)

	num.times do
		petition = Petition.find(rand(1..Petition.count))
		# Need to randomly select a user and only make signature join if their user object is already in the join
		user = User.find(rand(1..User.count))
		# query DB for Signature where user_id and petition_id
		if Signature.where(petition: petition, user: user).empty?
			petition.signatures.create(
				:user => user, 
				:message => Faker::Lorem.sentences(number: rand(3..10)).join(" "), 
				:anonymous => rand(0..1))
		end
	end

	puts ""
	puts "Created #{num} signatures..."
	puts ""
end


mega_seed(num_users, num_petitions, num_signatures)

pookie = User.create(name: "Pookie McGillicutty", email: "pookie@gmail.com", password: "1234")
dan = User.create(name: "Dan Foley", email: "dan@dan-foley.biz", password: "1234")
pookie.authored_petitions.create(title: "End Scooter McBooberson’s Reign of Terror", description: "She stinks!", goal: 5)