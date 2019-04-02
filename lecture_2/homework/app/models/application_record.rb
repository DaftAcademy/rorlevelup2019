class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def url
    "localhost:3000/" +  self.class.name.demodulize.downcase.pluralize(2)
  end

end
