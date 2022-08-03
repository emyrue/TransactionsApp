class Expense < ApplicationRecord
  belongs_to :user
  has_many :group_expenses, dependent: :destroy

  validates :name, presence: true
  validates :amount, presence: true, comparison: { greater_than: 0 }
end
