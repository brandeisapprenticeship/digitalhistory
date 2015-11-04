class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
    	t.datetime :due_date
    	t.string :description
    	t.string :title
      t.timestamps null: false
    end
  end
end
