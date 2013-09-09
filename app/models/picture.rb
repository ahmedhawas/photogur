class Picture < ActiveRecord::Base 	
  attr_accessible :artist, :title, :url

  make_flaggable :like
  attr_accessor :like


end
