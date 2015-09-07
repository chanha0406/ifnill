class Item < ActiveRecord::Base

	belongs_to :bucket
	has_one :support
	has_many :users, :through => :support

end
