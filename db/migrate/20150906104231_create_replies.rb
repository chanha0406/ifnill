class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|

    	 t.integer :user_id
    	 t.integer :bucket_id
    	 t.text :context

      t.timestamps null: false
    end
  end
end
