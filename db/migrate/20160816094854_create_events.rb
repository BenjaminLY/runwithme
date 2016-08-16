class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.datetime :datetime
      t.boolean :public
      t.string :type
      t.text :description
      t.string :place_name
      t.string :address
      t.integer :time_goal
      t.integer :trail_goal
      t.integer :nb_of_participants

      t.timestamps
    end
  end
end
