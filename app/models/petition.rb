class Petition < ApplicationRecord
	belongs_to :author, 
			   :class_name => "User"

	belongs_to :category

	has_many :signatures,
			 :dependent => :destroy
			 
	has_many :signers,
			 :through => :signatures,
			 :source => :user,
			 :foreign_key => :user_id

	validates :title, :presence => true
	validates :description, :presence => true
	validates :author_id, :presence => true
	validates :goal, :presence => true, numericality: { :greater_than => 0, :only_integer => true }

	accepts_nested_attributes_for :signatures
	accepts_nested_attributes_for :category

	def author_name
		self.author.name
	end

	def goal_percent
		((self.signatures.count.to_f / self.goal.to_f) * 100).round
	end

	def signature_count
		self.signatures.count
	end

	def signatures_brief
		self.signatures.order(:created_at => :desc).first(5)
	end

	def signatures_full
		self.signatures.order(:created_at => :desc)
	end

	def signature_need
		need = self.goal - self.signature_count
		need <= 0 ? 0 : need
	end

	def excerpt
		self.description.split(". ")[0..2].join + " [...]"
	end

	def self.most_signatures
		joins(:signatures).group("petitions.id").order(Arel.sql("COUNT(*) DESC"))
		 # returns an array of petitions even if there's only one 
		 # refactor this to check for ties and then display 
		 # all the top ties if applicable, otherwise if == 1
		 # display one petition
	end

	def self.goal_met
		joins(:signatures).group("petitions.id").having("COUNT(*) >= petitions.goal")
		# returns an array of petitions with goals met
	end

	def self.signature_report
		joins(:signatures).group("petitions.id").order(Arel.sql("COUNT(*) DESC")).count
		# returns a hash the following where key is petition id and value is number of signatures 
		# ordered DESC by number for signatures
		# {
		# 	3=>7, 4=>6, 2=>6, 11=>5, 8=>5, 5=>5, 16=>4, 14=>4, 7=>4, 19=>3, 
		# 	17=>3, 15=>3, 12=>3, 10=>2, 9=>2, 6=>2, 1=>2, 22=>1, 21=>1, 20=>1, 18=>1, 13=>1
		# }
	end
end
