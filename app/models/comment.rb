class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :commentables, polymorphic: true
  has_many :votes, as: :voteables


  validates :body, presence: true
end
