class Category < ActiveRecord::Base
has_many :notices, :dependent => :destroy
end
