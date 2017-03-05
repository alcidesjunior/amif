class CreateProfessors < ActiveRecord::Migration[5.0]
  def change
    create_table :professors do |t|
      t.string :nome
      t.string :sobrenome
      t.string :graduacao
      t.integer :modalidades_id
      t.timestamps
    end
  end
end
