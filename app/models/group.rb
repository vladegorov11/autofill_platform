class Group < ApplicationRecord
  belongs_to :project
  has_many :tags, dependent: :destroy
end
