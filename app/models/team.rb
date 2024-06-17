class Team < ApplicationRecord

    has_many :tu_linker, dependent: :destroy
    has_many :users, through: :tu_linker
    has_many :boards, dependent: :destroy
    belongs_to :creator, class_name: "User"

    before_validation :strip_whitespace

    validates :name, presence: true
    
    after_create :create_default_tu_linker

    private

    def strip_whitespace
        self.name = self.name.strip
    end

    def create_default_tu_linker
        tu_linker.create(user_id: self.creator_id, team_id: self.id)
    end

end