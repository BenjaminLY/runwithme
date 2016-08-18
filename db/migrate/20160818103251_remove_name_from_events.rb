class RemoveNameFromEvents < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :name, :string
  end
end
