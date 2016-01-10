class Notice < ActiveRecord::Base
belongs_to :category
belongs_to :city 
 has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#", original: ['500x500>', :jpg] },
  convert_options: { thumb: "-quality 75 -strip", medium: "-quality 75 -strip", original: "-quality 85 -strip" },
 :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, size: { in: 0..500.kilobytes }, :content_type => /\Aimage\/.*\Z/
  validates :notice, presence: true, length: { minimum: 5 }
  validates :text, presence: true, length: { minimum: 15 }
  self.per_page = 40
 scope :visible, -> { where :state => "visible" } 
 scope :moderated, -> { where :state => "pending_review" }
end
