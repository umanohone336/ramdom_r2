class Report < ApplicationRecord
  belongs_to :location
  belongs_to :outfit
  belongs_to :task
  belongs_to :user
  has_one_attached :image
  has_one_attached :video
end
