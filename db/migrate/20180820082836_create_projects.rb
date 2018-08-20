class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :api_token
      t.string :auth_token
      t.integer :user_id
      t.timestamps
    end
    add_index :projects, :api_token, unique: true
    add_index :projects, :auth_token, unique: true
  end
end
