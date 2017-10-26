class User < ActiveRecord::Base
  has_many :teas

  def slug
    name.downcase.gsub(" ","-")
  end

  def self.find_by(slug)
    User.all.find_by {|user| user.slug == slug}
  end
end
