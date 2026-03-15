class Exercise < ApplicationRecord
  belongs_to :user
  has_many :training_logs, dependent: :destroy

  validates :name, presence: true
end
