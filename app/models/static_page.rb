class StaticPage < ApplicationRecord
  validates_uniqueness_of :permalink
  validates :name, presence: true
  validates :content, presence: true
  has_attached_file :image
  validates_attachment_content_type :image, :content_type => ['image/jpg', 'image/jpeg', 'image/png']

  def to_param
    permalink
  end
end
