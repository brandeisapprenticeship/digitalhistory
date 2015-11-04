class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
    	t.string :title
    	t.string :url
    	t.string :justification
    	t.integer :parent_id
    	t.boolean :favorite
    	t.boolean :document
    	t.integer :submission_id
      t.timestamps null: false
    end
  end
end
