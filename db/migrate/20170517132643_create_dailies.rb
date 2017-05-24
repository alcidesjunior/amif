class CreateDailies < ActiveRecord::Migration[5.0]
  def change
    create_table :dailies do |t|
      t.belongs_to :atletum, index: true
      t.belongs_to :modalidade
      t.belongs_to :professor
      t.integer :status
      t.timestamps
    end
  end
end
