class CreatePathComments < ActiveRecord::Migration
  def change
    create_table :path_comments do |t|
      t.integer :submission_id
      t.string :text
      t.integer :user_id
      t.boolean :present

      t.timestamps null: false
    end
  end
end
