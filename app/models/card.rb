class Card < ApplicationRecord

    belongs_to :status_list, class_name: "StatusList"
    belongs_to :creator, class_name: "User"
    belongs_to :assignee, class_name: "User", optional: true

    validates :title, presence: true
    validates :priority, presence: true, inclusion: {in: %w(low medium high)}

end