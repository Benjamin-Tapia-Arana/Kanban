class StatusList < ApplicationRecord

    belongs_to :board, class_name: "Board"
    has_many :cards, dependent: :destroy

    validates :title, presence: true

end