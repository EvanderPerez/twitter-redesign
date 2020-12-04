require 'rails_helper'

RSpec.describe User, type: :model do 



user_name = (0..15).map {((0..9).to_a+('a'..'z').to_a)[rand(36)] }.join
 long_name = (0..50).map { ('a'..'z').to_a[rand(26)] }.join

 describe "Validation to name field" do
     it { should validate_presence_of :name }
     it { should validate_length_of(:name).is_at_least(1).on(:create) }
     it { should_not allow_value('').for(:name) }
     it { should_not allow_value(long_name).for(:name)}
     it { should allow_value('Juan').for(:name) }
 end



 describe "Validation to last name" do

    it { should validate_presence_of :last_name }
    it { should validate_length_of(:last_name).is_at_least(1).on(:create) }
    it { should_not allow_value('').for(:last_name) }
    it { should allow_value('Perez').for(:last_name) }
    it { should_not allow_value(long_name).for(:last_name)}
 end
 
 describe "Validation to email" do
     it { should validate_presence_of :email  }
     it { should allow_value('sanandres@hotmail.com').for(:email) }
     it { should_not allow_value('565656').for(:email)  }
 end
 
 describe "Validation to password" do
  it { should validate_presence_of :password  }
  it { should validate_length_of(:password).is_at_least(6).on(:create) }
  it { should_not allow_value('').for(:name) }
  it { should have_secure_password}

end

describe "Validation to username" do
  it { should validate_presence_of :username  } 
  it { should validate_length_of(:username).is_at_least(1).on(:create) }
  it { should_not allow_value(user_name).for(:username)}

end


end

