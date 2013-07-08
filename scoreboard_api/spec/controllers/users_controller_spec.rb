require 'spec_helper'

describe UsersController do

  describe "#create" do
    context "when a user is created" do
      before do
        post :create, :name => 'Henruz'
      end
      it { should respond_with(:created) }
    end
  end

end
