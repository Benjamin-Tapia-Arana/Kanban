class Board < ApplicationRecord

    has_many :status_lists, dependent: :destroy
    belongs_to :creator, class_name: "User"
    belongs_to :team, class_name: "Team"

    after_create :create_default_status_lists

    validates :title, presence: true

    private

    def create_default_status_lists
        status_lists.create(title: 'To do')
        status_lists.create(title: 'WIP')
        status_lists.create(title: 'Done')
    end

end