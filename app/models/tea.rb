class Tea < ActiveRecord::Base
  belongs_to :user
  has_many :tea_types
  has_many :types, :through => :tea_types
end
