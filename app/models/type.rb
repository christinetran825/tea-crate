class Type < ActiveRecord::Base
  belongs_to :tea
  has_many :tea_names
  has_many :origins
  has_many :leaves
  has_many :caffeine
  has_many :pairings
  has_many :brew_times
  has_many :brands

  attr_reader :tea_name, :origin, :leaves, :caffeine, :pairings, :brew_times, :brands

  TYPE = []

  def initialize(args)
    @tea_name = args[:tea_name]
    @origin = args[:origin]
    @leaves = args[:leaves]
    @caffeine = args[:caffeine]
    @pairings = args[:pairings]
    @brew_times = args[:brew_times]
    @brands = args[:brands]
    TYPE << self
  end

  def self.all
    TYPE
  end

end
