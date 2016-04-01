class User < ActiveRecord::Base

  has_many :reviews

  has_secure_password

  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create

  def full_name
    "#{firstname} #{lastname}"
  end

  def self.filter(user_type, search_term)
    users = User.all
    if user_type == "user_id"
      users = users.where("id like ?", "%#{search_term}%")
    elsif user_type == "user_email"
      users = users.where("email like ?", "%#{search_term}%")
    elsif user_type == "all"
      users = users.where("id like ? OR email like ?", "%#{search_term}%", "%#{search_term}%")
    end
    users
  end

end
