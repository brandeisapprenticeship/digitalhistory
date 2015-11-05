class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.integer :user_id
      t.integer :assignment_id
    	t.string :title
    	t.string :url
    	t.string :justification
    	t.integer :parent_id
    	t.boolean :favorite
    	t.boolean :document
      t.timestamps null: false
    end
  end
end
