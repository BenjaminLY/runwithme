class ChangeTypeToEvents < ActiveRecord::Migration[5.0]
  def change
    rename_column :events, :type, :kind
  end
end
