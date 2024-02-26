# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :user, optional: true
  validates :title, presence: true
  validates :description, presence: true
  validates :due_date, presence: true

  enum status: %i[pending in_progress completed]
end
