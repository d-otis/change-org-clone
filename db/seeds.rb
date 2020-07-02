# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


def mega_seed(users, signatures)
	puts ""
	puts "Beginning Seed..."
	puts ""

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
	randomized_users = (1..User.count).sort{ rand() - 0.5 }

	randomized_users.each do |p|
		rand(0..3).times do
			Petition.create(
				:title => Faker::Lorem.sentence(word_count: rand(5..11)), 
				:description => LoremIpsumText::multiple_para(rand(10..30)).join("\r\n\r\n"),
				:author_id => p, 
				:goal => rand(12..20))
		end
	end

	puts ""
	puts "Created #{Petition.count} petitions..."
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
	puts "Created #{Signature.count} signatures..."
	puts ""
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
pookie.authored_petitions.create(title: "End Scooter McBooberson’s Reign of Terror", description: "She stinks!", goal: 5)