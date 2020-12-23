class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def number_to_currency(number)
  ActiveSupport::NumberHelper.number_to_currency(number)
  end
end
