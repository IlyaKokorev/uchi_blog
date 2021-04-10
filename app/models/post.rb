class Post < ApplicationRecord
  validates :title, :summary, :content, presence: true
end
