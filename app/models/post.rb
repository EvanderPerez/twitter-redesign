class Post < ApplicationRecord
  belongs_to :user

  validates :text, presence: true, length: {minimum:1, maximum:250}
end
