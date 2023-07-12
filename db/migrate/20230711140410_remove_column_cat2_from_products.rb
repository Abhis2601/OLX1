class RemoveColumnCat2FromProducts < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :category, :string
  end
end
