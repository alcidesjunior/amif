class AddUsersIdToProfessors < ActiveRecord::Migration[5.0]
  def change
    add_column :professors, :users_id, :integer
  end
end
