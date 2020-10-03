class Channel < ApplicationRecord
  has_many :messages

  validates :name, presence: true, format: { with: /\A[\w-]+\z/, message: "only allows letters, numbers, dashes or/and underlines"}, uniqueness: { case_sensitive: false }
end
