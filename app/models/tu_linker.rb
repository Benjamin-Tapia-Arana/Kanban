class TuLinker < ApplicationRecord

  belongs_to :team, class_name: "Team"
  belongs_to :user, class_name: "User"

end