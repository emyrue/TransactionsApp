class Group < ApplicationRecord
  belongs_to :user
  has_many :group_expenses

  validates :name, presence: true
  validates :icon, presence: true
end
