class Category < ActiveRecord::Base
has_many :notices, :dependent => :destroy
acts_as_tree
end
