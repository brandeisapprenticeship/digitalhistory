class CreatePathComments < ActiveRecord::Migration
  def change
    create_table :path_comments do |t|
      t.string :text
      t.integer :user_id
      t.integer :assignment_author
      t.integer :assignment_id
      t.boolean :present

      t.timestamps null: false
    end
  end
end
