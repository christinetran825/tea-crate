class User < ActiveRecord::Base
  has_many :teas

  has_secure_password

  def slug
    name.downcase.gsub(" ","-")
  end

  def self.find_by(slug)
    User.all.find_by {|user| user.slug == slug}
  end
end
