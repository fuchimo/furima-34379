class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def next
    Item.where("id<?",self.id).order("id DESC").first
  end

  def previous
    Item.where("id>?",self.id).order("id ASC").first
  end
  
end
