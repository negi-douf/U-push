class Page < ActiveRecord::Base
  validates :url, presence: true
  # belongs_to :user
end
