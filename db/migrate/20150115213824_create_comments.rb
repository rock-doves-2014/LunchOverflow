class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content, null: false
      t.references :user
      t.references :post
      t.integer :parent_id
      t.timestamps
    end
  end
end
