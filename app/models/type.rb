class Type < ActiveRecord::Base
  belongs_to :tea
  has_many :origins
  has_many :leaves
  has_many :caffeine
  has_many :pairings
  has_many :brew_times
  has_many :brands
end
