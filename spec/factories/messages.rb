FactoryGirl.define do
  factory :message do
    to "5030000000"
    from "5030000000"
    body "Test message"
  end
end
