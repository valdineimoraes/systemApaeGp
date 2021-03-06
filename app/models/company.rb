class Company < ApplicationRecord
  validates :name, presence: true
  validates :site, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp }
  validates :operation, presence: true

  has_many :trainees, dependent: :restrict_with_error

  mount_uploader :image, CompanyUploader
end
