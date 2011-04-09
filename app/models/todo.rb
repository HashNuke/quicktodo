class Todo < ActiveRecord::Base
  has_many :tasks, :dependent=>:destroy

  accepts_nested_attributes_for :tasks, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true

  validates_presence_of :name, :message => "A todo list without a name?"

  after_create :create_url_hash

  def create_url_hash
    if self.id.to_s.length == 1
      taskID = "0" << self.id.to_s
    else
      taskID = self.id.to_s
    end
    
    url_hash = Base32.encode(taskID).gsub("=", "")
    self.update_attribute(:url_hash, url_hash)
  end
  
  
end
