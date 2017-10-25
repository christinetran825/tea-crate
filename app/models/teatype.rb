class TeaType < ActiveRecord::Base
  belongs_to :tea
  belongs_to :type
end
