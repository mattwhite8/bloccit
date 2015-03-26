FactoryGirl.define do
  factory :user do 
    name "Douglas Adams"
    sequence(:email, 100) { |n| "person#{n}@example.com" }
    password "helloworld"
    password_confirmation "helloworld"
    confirmed_at Time.now
    
     factory :user_with_post_and_comment do 
      after(:build) do |user|
      create(:comment, user: user)
      create(:post, user: user)
    end
   end

  end     
end
