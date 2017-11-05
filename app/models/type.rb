class Type < ActiveRecord::Base
  has_many :teas, :through => :tea_types
  has_many :tea_types
  has_many :users, :through => :teas
end
