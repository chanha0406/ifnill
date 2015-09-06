class Bucket < ActiveRecord::Base

	has_many :items
	has_many :supports
	has_many :replies

end
