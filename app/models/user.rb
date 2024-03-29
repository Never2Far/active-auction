class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
   :rememberable, :validatable

  devise :omniauthable, omniauth_providers: [:google, :facebook]

  # validates :email, presence: true
  validates :username, uniqueness: { case_sensitive: false }
  # validates :username, length: {minimum: 3}


  has_many :auctions, inverse_of: 'admin'
  has_many :listings, inverse_of: 'seller'
  has_many :bids, inverse_of: 'buyer'
  has_many :questions, inverse_of: 'buyer'


         def auctions
            auctions = []
            Auction.all.each do |auction|
              if auction.admin == self
                auctions << auction
              end
            end
            auctions
          end

          def questions
            questions = []
            Question.all.each do |question|
              if question.buyer == self
                questions << question
              end
            end
            questions
          end

          def bids
            bids = []
            Bid.all.each do |bid|
              if bid.buyer == self
                bids << bid
              end
            end
            bids
          end

          def listings
            listings = []
            Listing.all.each do |listing|
              if listing.seller == self
                listings << listing
              end
            end
            listings
          end


         def self.from_omniauth(access_token)
          data = access_token.info
          user = User.where(email: data['email']).first
      
          unless user
              user = User.create(name: data['name'],
                 email: data['email'],
                 password: Devise.friendly_token[0,20]
              )
          end
          user
      end
       
        def self.new_with_session(params, session)
          super.tap do |user|
            if data = session["devise.google_data"] && session["devise.google_data"]["extra"]["raw_info"]
              user.email = data["email"] if user.email.blank?
            end
          end
        end
end