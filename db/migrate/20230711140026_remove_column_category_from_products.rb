class RemoveColumnCategoryFromProducts < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :catrgory, :string
  end
end
