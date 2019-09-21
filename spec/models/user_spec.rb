require 'rails_helper'

RSpec.describe User, type: :model do
  let(:first_name)  {"first"}
  let(:last_name)   {"last"}
  subject { build(:user, first_name: first_name, last_name: last_name)}

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
    
    it "is not valid without email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end
  end

  describe "Associations" do
    it "has many authored_conversations" do
      assc = described_class.reflect_on_association(:authored_conversations)
      expect(assc.macro).to eq :has_many
    end

    it "has many received_conversations" do
      assc = described_class.reflect_on_association(:received_conversations)
      expect(assc.macro).to eq :has_many
    end

    it "has many private_conversations" do
      assc = described_class.reflect_on_association(:private_conversations)
      expect(assc.macro).to eq :has_many
    end

    it "can attach an avatar" do
      user_with_avatar =  create(:user_with_avatar)
      expect(user_with_avatar.avatar).to be_attached 
    end
  end

  describe "#full_name" do
    it "returns capitalized full name" do
      expect(subject.full_name).to include(first_name.capitalize)
      expect(subject.full_name).to include(last_name.capitalize)
    end
  end
end
