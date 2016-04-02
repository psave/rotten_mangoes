class User < ActiveRecord::Base

  has_many :reviews

  has_secure_password

  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create

  scope :search_user_id, -> (search_term) { where("id like ?", "%#{search_term}%")}

  scope :search_user_email, -> (search_term) { where ("email like ?", "%#{search_term}")}

  scope :search_user_id_or_email, -> (search_term) { where ("id like ? OR email like ?", "%#{search_term}%", "%#{search_term}%")}

  def full_name
    "#{firstname} #{lastname}"
  end

  def self.filter(user_type, search_term)
    users = User.all
    if user_type == "user_id"
      users = users.search_user_id(search_term)
    elsif user_type == "user_email"
      users = users.search_user_email(search_term)
    elsif user_type == "all"
      users = users.search_user_id_or_email(search_term)
    end
    users
  end

end
