require 'rails_helper'

RSpec.describe User, type: :model do
  it 'generates a valid user' do
    expect{User.create(email: "abc@account.com", password: '123456')}.to change {User.count}.by(1)
  end
end
