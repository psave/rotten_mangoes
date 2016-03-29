class User < ActiveRecord::Base
  has_secure :password
end
