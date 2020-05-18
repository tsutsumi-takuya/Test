class CreatePhotoComments < ActiveRecord::Migration[5.2]
  def change
    create_table :photo_comments do |t|

		t.text :comment
		t.integer :user_id
    	t.string :photo_id

      	t.timestamps
    end
  end
end
