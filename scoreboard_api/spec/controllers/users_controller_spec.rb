require 'spec_helper'

describe UsersController do

  describe "#create" do
    context "when a user is created" do
      before do
        post :create, :name => 'Henruz'
      end
      it { should respond_with(:created) }
      it { should have_rendered(format: :json) }
    end
  end
  
  describe "#show" do
    context "when a user is found" do
      let(:user) { FactoryGirl.create :user }
      before do
        get :show, :id => user.id
      end
      it { should respond_with(:success) }
      it { should have_rendered(format: :json) }
    end
  end
  
  describe "#destroy" do
    context "when a user is deleted" do
      let(:user) { FactoryGirl.create :user }
      before do
        delete :destroy, :id => user.id
      end
      it { should respond_with(:no_content) }
    end
  end
  
  describe "#update" do
    context "when a user is modified" do
      let(:user) { FactoryGirl.create :user }
      before do
        put :update, :id => user.id, :name => 'Henruz'
      end
      it { should respond_with(:success) }
      it { should have_rendered(format: :json) }
    end
  end

end
