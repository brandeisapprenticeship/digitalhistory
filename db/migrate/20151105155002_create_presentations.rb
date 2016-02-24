class CreatePresentations < ActiveRecord::Migration
  def change
    create_table :presentations do |t|
    	t.integer :assignment_author
    	t.integer :assignment_id
      t.timestamps null: false
    end
  end
end
