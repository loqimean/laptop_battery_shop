# table users
#    email                     string              null: false
#    encrypted_password        string              null: false
#    first_name                string              null: false
#    last_name                 string              null: false
#    address                   string
#    phone                     string
#    reset_password_token      datetime
#    reset_password_sent_at    datetime
#    remember_created_at       datetime
#    created_at                datetime            null: false
#    updated_at                datetime            null: false
#
#    has_many :orders, foreign_key: :customer_id

#    validates :first_name, :last_name, presence: true
#    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
#    validates :password, :presence => true,
#                         :length => {:within => 8..128},
#                         :on => :create

require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:email) }

    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_length_of(:password).is_at_least(8) }
    it { is_expected.to validate_length_of(:password).is_at_most(128) }

    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }

    it { is_expected.to allow_value("user123_-test.user@example-abc123.com").for(:email) }
    it { is_expected.not_to allow_value("/asd").for(:password) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:orders).dependent(:nullify) }
  end
end
