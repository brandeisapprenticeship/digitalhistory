class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.integer :user_id
      t.integer :assignment_id
    	t.string :title
    	t.string :url
    	t.string :justification
    	t.integer :parent_id, :null=>true, :index=>true
      t.integer :lft, :null=>false, :index=>true
      t.integer :rgt, :null=>false, :index=>true
    	t.boolean :favorite
    	t.boolean :document
      t.timestamps null: false
    end
  end
end
