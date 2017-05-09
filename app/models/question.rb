class Question < ApplicationRecord
  belongs_to :user
  has_many :answers
  has_many :votes, as: :voteables
  has_many :comments, as: :commentables

  validates :title, presence: true
  validates :body, presence: true,
                    length: { minimum: 10 }
end
