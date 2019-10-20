require "rails_helper"

describe ConversationsController, type: :controller do
  before(:each) do
    sign_in(User.first)
  end

  describe '#index' do
    it 'renders the conversations list page' do
      get :index
      expect(response.status).to eql(200)
    end
  end

  describe '#show' do
    it 'renders the conversations show page' do
      conversation = Conversation.create!(author: User.first, receiver: User.second)
      get :show, params: {id: conversation.id}
      expect(assigns(:conversation)).to eql(conversation)
      expect(response.status).to eql(200)
    end
  end
end
