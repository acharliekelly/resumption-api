class AddColumnToSections < ActiveRecord::Migration[5.2]
  def change
    add_column :sections, :format, :string
  end
end