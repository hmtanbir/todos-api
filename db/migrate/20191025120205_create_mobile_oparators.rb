class CreateMobileOparators < ActiveRecord::Migration[5.0]
  def change
    create_table :mobile_oparators do |t|
      t.string :name

      t.timestamps
    end
  end
end
