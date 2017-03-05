class CreateAtleta < ActiveRecord::Migration[5.0]
  def change
    create_table :atleta do |t|
      t.string :nome
      t.string :sobrenome
      t.date :data_nascimento
      t.string :sexo
      t.string :email
      t.string :nacionalidade
      t.string :telefone1
      t.string :telefone2
      t.string :graduacao
      t.integer :professors_id
      t.integer :modalidades_id
      t.timestamps
    end
  end
end
