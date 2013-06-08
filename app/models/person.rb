class Person < ActiveRecord::Base
  attr_accessible :image, :ip, :is_anon, :name
end
