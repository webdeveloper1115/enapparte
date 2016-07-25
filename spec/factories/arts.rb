FactoryGirl.define do
  factory :art do
    title "MyString"
    description "MyText"
  end

end

# == Schema Information
#
# Table name: arts
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#
