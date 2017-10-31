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

  def initialize(params)
    @tea_name = params[:tea_name]
    @origin = params[:origin]
    @leaves = params[:leaves]
    @caffeine = params[:caffeine]
    @pairings = params[:pairings]
    @brew_times = params[:brew_times]
    @brands = params[:brands]
    TYPE << self
  end

  def self.all
    TYPE
  end

end
