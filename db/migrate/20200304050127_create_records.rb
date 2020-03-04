class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.string :custom_record
      t.string :maintenance_record
      t.references :guitar, foreign_key: true

      t.timestamps
    end
  end
end
