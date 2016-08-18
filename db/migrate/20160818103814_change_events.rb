class ChangeEvents < ActiveRecord::Migration[5.0]
  def change
	change_table :events do |t|
  	  t.remove :nb_of_participants
  	  t.rename :public, :private
  	  t.rename :kind, :type_of
  	  t.rename :place_name, :meeting_point
  	end
  end
end
