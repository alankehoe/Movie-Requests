class Movie < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name, :message => 'This movie already exists'

  before_validation :upcase_name

  private
  def upcase_name
    self.name = self.name.upcase if self.name.present?
  end
end
