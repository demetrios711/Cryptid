class ApplicationRecord < ActiveRecord::Base
  # require 'devise'
  self.abstract_class = true
  # before_action :authenticate_user!

end
