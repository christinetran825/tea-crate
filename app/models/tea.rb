class Tea < ActiveRecord::Base
  belongs_to :user
  has_many :types
  has_many :origins, through: :types
  has_many :leaves, through: :types
  has_many :caffeine, through: :types
  has_many :pairings, through: :types
  has_many :brew_times, through: :types
  has_many :brands, through: :types
end
