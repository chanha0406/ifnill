class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|

    	 t.integer :f_bucket_id
    	 t.string :name
    	 t.string :intro
    	 t.integer :state

      t.timestamps null: false
    end
  end
end
