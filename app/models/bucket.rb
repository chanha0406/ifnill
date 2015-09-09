class Bucket < ActiveRecord::Base

	serialize :image_url, Array

	has_many :items
	has_many :supports
	has_many :replies

end
