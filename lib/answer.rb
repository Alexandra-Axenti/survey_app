class Answer < ActiveRecord::Base
  belongs_to(:question)
  validates(:description, :presence=>true)

  def a_method_used_for_validation_purposes
    errors.add(:description, "description is blank, please fill in something")
  end

end
