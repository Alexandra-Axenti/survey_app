class Survey < ActiveRecord::Base
  has_many(:questions)
  validates(:title, :presence=>true)
  before_save(:capitalize_title)

def a_method_used_for_validation_purposes
  errors.add(:title, "title is blank, please fill in something")
end

private

  define_method(:capitalize_title) do
    self.title=(title().split.map(&:capitalize).join(' '))
  end
end
