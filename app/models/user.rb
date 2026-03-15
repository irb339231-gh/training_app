class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :exercises, dependent: :destroy
  has_many :training_logs, dependent: :destroy
end
