class AddScreenshotToSteps < ActiveRecord::Migration
  def change
    add_column :steps, :screenshot, :string
  end
end
