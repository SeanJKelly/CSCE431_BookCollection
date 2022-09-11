class Book < ApplicationRecord
    validates :title, :author, presence: true
    validates :price, numericality: true
    validates :published_date, presence: true
end
