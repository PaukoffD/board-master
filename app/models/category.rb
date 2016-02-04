class Category < ActiveRecord::Base
has_many :notices, :dependent => :destroy
acts_as_tree
extend ActsAsTree::TreeWalker

  acts_as_tree order: 'name'
  
 acts_as_taggable
 
  
end
