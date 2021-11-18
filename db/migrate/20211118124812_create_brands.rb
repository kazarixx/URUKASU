class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |t|
      t.integer :user_id
      t.integer :prefecture_id
      t.string :brand_name
      t.string :jan
      t.text :body
      t.string :brand_image_id

      t.timestamps
    end
  end
end
