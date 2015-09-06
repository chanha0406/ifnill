class CreateSupports < ActiveRecord::Migration
  def change
    create_table :supports do |t|

    	 t.integer :f_user_id
    	 t.integer :f_item_id
    	 t.integer :f_bucket_id

      t.timestamps null: false
    end
  end
end
