class AddColorForCategories < ActiveRecord::Migration[5.1]
  def change
  	add_column :categories, :color, :string
  	add_column :categories, :letter, :string
  end
end
