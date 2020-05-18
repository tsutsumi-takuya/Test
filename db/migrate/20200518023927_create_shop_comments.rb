class CreateShopComments < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_comments do |t|

		t.text :comment
		t.integer :user_id
    	t.string :photo_id

      	t.timestamps
    end
  end
end
