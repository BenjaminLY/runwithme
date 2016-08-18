class AddColumnDescriptionToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :expectation, :string
    add_column :users, :description, :text
  end
end
