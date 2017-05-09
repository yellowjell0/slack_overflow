class Vote < ApplicationRecord
    belongs_to :user
    belongs_to :voteables, polymorphic: true
end
