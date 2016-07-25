FactoryGirl.define do
  factory :booking do
    status 1
    date "2016-01-17 05:15:16"
    spectators 1
    price 1.5
    message "MyText"
    payout 1.5
    payment_received? false
    payment_sent? false
    paid_on "2016-01-17 05:15:16"
    paid_out_on "2016-01-17 05:15:16"

    factory :booking_with_rating do
      after(:create) do |booking|
        create :review, booking: booking
      end
    end
  end

end

# == Schema Information
#
# Table name: bookings
#
#  id                :integer          not null, primary key
#  status            :integer
#  date              :datetime
#  spectators        :integer
#  price             :float
#  message           :text
#  payout            :float
#  payment_received? :boolean
#  payment_sent?     :boolean
#  paid_on           :datetime
#  paid_out_on       :datetime
#  show_id           :integer
#  user_id           :integer
#  address_id        :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  payment_method_id :integer
#
# Indexes
#
#  index_bookings_on_address_id         (address_id)
#  index_bookings_on_payment_method_id  (payment_method_id)
#  index_bookings_on_show_id            (show_id)
#  index_bookings_on_user_id            (user_id)
#
# Foreign Keys
#
#  fk_rails_f65e591682  (payment_method_id => payment_methods.id)
#
