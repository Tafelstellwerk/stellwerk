class AddColumnsToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :best_before_date, :string
    add_column :donations, :availible_from, :string
    add_column :donations, :froozen, :boolean
    add_column :donations, :supporting_document, :boolean
    add_column :donations, :fetch_time, :string
  end
end
