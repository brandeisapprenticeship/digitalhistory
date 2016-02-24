class CreateStepComments < ActiveRecord::Migration
  def change
    create_table :step_comments do |t|
      t.integer :step_id
      t.string :text
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
