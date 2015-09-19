class Bucket < ActiveRecord::Base

	serialize :images, Array

	mount_uploader :thumbnail, BucketImageUploader

	belongs_to :user

	has_many :items
	has_many :supports
	has_many :replies

	validates :name, :presence => true
	validates :intro_simple, :presence => true
	validates :intro_detail, :presence => true
	validates :finish_date, :presence => true, format: { with: /\A\d+-\d+-\d+\z/}
	validates :start_date, :presence => true, format: { with: /\A\d+-\d+-\d+\z/}

end
