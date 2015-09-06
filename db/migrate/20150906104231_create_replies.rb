class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|

    	 t.integer :f_user_id
    	 t.integer :f_bucket_id
    	 t.text :context

      t.timestamps null: false
    end
  end
end
