class CreateExtensions < ActiveRecord::Migration
  def change
    create_table :extensions do |t|
    	t.integer :assignment_id
    	t.integer :user_id
    	t.datetime :new_due_date
      t.timestamps null: false
    end
  end
end
