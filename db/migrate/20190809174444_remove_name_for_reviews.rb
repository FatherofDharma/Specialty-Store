class RemoveNameForReviews < ActiveRecord::Migration[5.2]
  def change
    remove_column(:reviews, :name)
  end
end
