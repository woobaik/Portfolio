class Skill < ApplicationRecord
  include Placeholder
  validates_presence_of :title, :percent_utilized

  after_initialize :set_badge

  def set_badge
    self.badge ||= Placeholder.image_generator(height: '250', width: '250')
  end
end
