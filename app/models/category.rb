class Category < ActiveRecord::Base

	# let category know about the links
	has_many :links

	# lets add some validation to make sure the data is waht we want it to be
	validates :name, presence: true, uniqueness: { message: "already gone", case_sensitive: false }
	validates :rank, presence: true, numericality: { greater_than: 0 }

end
