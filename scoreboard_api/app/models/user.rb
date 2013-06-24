class User < ActiveRecord::Base
  attr_accessible :loses_count, :name, :wins_count
end
