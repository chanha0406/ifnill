class CreateBuckets < ActiveRecord::Migration
  def change
    create_table :buckets do |t|



    	t.integer	:user_id
    	t.string		:bucket_name
    	



      t.timestamps null: false
    end
  end
end
