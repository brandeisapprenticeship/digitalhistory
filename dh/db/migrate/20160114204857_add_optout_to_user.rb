class AddOptoutToUser < ActiveRecord::Migration
  def change
    add_column :users, :optout, :boolean
  end
end
