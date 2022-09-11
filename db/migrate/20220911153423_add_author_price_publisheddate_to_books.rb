class AddAuthorPricePublisheddateToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :author, :string
    add_column :books, :price, :numerical
    add_column :books, :published-date, :Datetime
  end
end
