class CreateRelations < ActiveRecord::Migration[5.0]
  def change
    create_table :relations do |t|
      t.string :sudo
      t.belongs_to :company, index: true
      t.belongs_to :person, index: true

      t.timestamps
    end
  end
end
