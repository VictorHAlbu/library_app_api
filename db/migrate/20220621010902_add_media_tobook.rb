class AddMediaTobook < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :media, :integer
  end
end
