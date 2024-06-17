class User < ApplicationRecord

    devise :database_authenticatable, :registerable, :rememberable, :validatable
    
    has_many :tu_linker, dependent: :destroy
    has_many :teams, through: :tu_linker
    has_many :boards, through: :teams
    has_many :created_teams, class_name: "Team", foreign_key: "creator_id", dependent: :destroy
    has_many :created_cards, class_name: "Card", foreign_key: "creator_id", dependent: :destroy
    has_many :assigned_cards, class_name: "Card", foreign_key: "assignee_id", dependent: :destroy
    has_many :created_boards, class_name: "Board", foreign_key: "creator_id", dependent: :destroy

    validates :username, presence: true, uniqueness: true
    validates :full_name, presence: true
    validates :email, presence: true, uniqueness: true, format: {with: URI::MailTo::EMAIL_REGEXP}
    validates :full_name, presence: true
    validates :encrypted_password, presence: true, length: {minimum: 8}

    before_validation :strip_whitespace
    before_validation :downcase_email 
    before_validation :regulrize_username

    private
        def strip_whitespace
            self.username = username&.strip
            self.email = email&.strip
            self.full_name = full_name&.strip
        end

        def downcase_email
            self.email = email&.downcase
        end

        def regulrize_username
            self.full_name = full_name&.titleize
        end

end
