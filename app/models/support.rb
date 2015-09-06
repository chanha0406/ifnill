class Support < ActiveRecord::Base

	belongs_to :user
	belongs_to :item
	belongs_to :bucket

end
