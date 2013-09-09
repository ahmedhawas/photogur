class User < ActiveRecord::Base
	make_flagger
  attr_accessible :name

end
