class AddCategoriaToAtleta < ActiveRecord::Migration[5.0]
  def change
    add_column :atleta, :categoria, :integer
  end
end
