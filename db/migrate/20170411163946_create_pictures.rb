class CreatePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures do |t|
      t.references :room, foreign_key: true

      t.timestamps
    end
  end
end
