class CreatePosts < ActiveRecord::Migration
  has_many :comments
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
