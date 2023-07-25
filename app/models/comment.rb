class Comment < ApplicationRecord
  belongs_to :post, counter_cache: true
  validates :content, length: { minimum: 10 }
end
