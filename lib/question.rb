class Question < ActiveRecord::Base
  belongs_to(:survey)
  has_many(:answers)
  validates(:name, :presence=>true)

  def a_method_used_for_validation_purposes
    errors.add(:name, "name is blank, please fill in something")
  end

end
