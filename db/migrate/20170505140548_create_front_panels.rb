class CreateFrontPanels < ActiveRecord::Migration[5.0]
  def change
    create_table :front_panels do |t|
      t.string :titulo
      t.string :conteudo
      t.timestamps
    end
  end
end
