class AddColumnToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :last_name, :string
    add_column :users, :first_name, :string
    add_column :users, :job_title, :string
    add_column :users, :run_level, :string
  end
end
