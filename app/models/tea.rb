class Tea < ActiveRecord::Base
  belongs_to :user
  has_many :types
  has_many :origins, through: :types
  has_many :leaves, through: :types
  has_many :caffeine, through: :types
  has_many :pairings, through: :types
  has_many :brew_times, through: :types
  has_many :brands, through: :types


  attr_reader :name

  TEA = []

  def initialize(params)
    @tea_name = params[:tea_name]
    TEA << self
  end

  def self.all
    TEA
  end
end
