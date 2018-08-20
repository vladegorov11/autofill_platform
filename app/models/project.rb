class Project < ApplicationRecord
  has_many :groups, dependent: :destroy
  has_secure_token  :auth_token
  has_secure_token  :api_token
end
