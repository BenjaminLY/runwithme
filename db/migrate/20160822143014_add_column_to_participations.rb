class AddColumnToParticipations < ActiveRecord::Migration[5.0]
  def change
    add_column :participations, :running_time, :integer
    add_column :participations, :kilometers, :integer
  end
end
