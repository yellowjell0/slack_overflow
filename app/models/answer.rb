class Answer < ApplicationRecord

  belongs_to :user
  belongs_to :question
  has_many :comments, as: :commentables
  has_many :votes, as: :voteables

  validates :body, presence: true

end
