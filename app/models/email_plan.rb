class EmailPlan < ApplicationRecord
	validates	:name, presence: true
	validates	:expiration, presence: true
	paginates_per 5

	def self.search(term)
	  if term
	    where('name LIKE ?', "%#{term}%")
	  else
	    all
	  end
	end
end