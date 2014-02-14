class Code < ActiveRecord::Base
  self.inheritance_column = nil

  attr_accessible :type, :code
end
