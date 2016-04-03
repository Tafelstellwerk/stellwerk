class CreateTafels < ActiveRecord::Migration
  def change
    create_table :tafels do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
