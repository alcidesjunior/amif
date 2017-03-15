class CreateModalidades < ActiveRecord::Migration[5.0]
  def change
    create_table :modalidades do |t|
      t.string :nome
      t.attachment :imagem
      t.timestamps
    end
  end
end
