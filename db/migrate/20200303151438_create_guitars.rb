class CreateGuitars < ActiveRecord::Migration[5.2]
  def change
    create_table :guitars do |t|
      t.string :category
      t.string :brand
      t.string :model
      t.string :neck_type
      t.string :neck_wood
      t.string :body_type
      t.string :body_wood
      t.string :fret
      t.string :number_of_fret
      t.string :fret_wood
      t.string :scale
      t.string :nut
      t.string :bridge
      t.string :string_space
      t.string :neck_pickup
      t.string :middle_pickup
      t.string :bridg_pickup
      t.string :controlls
      t.string :tuners
      t.string :tuning
      t.string :string_gauge
      t.string :string_brand
      t.string :hardware_color
      t.string :main_or_sub
      t.string :others
      t.string :comment
      t.string :image
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
