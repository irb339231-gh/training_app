class TrainingLog < ApplicationRecord
  belongs_to :user
  belongs_to :exercise

  validates :date, presence: true
  validates :weight, presence: true, numericality: { greater_than: 0 }
  validates :reps, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :sets, presence: true, numericality: { only_integer: true, greater_than: 0 }

  def start_time
    date
  end
end
