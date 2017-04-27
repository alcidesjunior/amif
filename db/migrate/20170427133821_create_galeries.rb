class CreateGaleries < ActiveRecord::Migration[5.0]
  def change
    create_table :galeries do |t|
      t.attachment :imagem

      t.timestamps
    end
  end
end
