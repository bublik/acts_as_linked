class SitesCategory < ActiveRecord::Base
  has_many :friend_sites
  
  validates_uniqueness_of :identifier
  validates_presence_of :name

  def to_param
    "#{self.id}-#{self.name}"
  end
end
