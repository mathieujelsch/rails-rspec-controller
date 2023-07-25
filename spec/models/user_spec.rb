require 'rails_helper'

RSpec.describe User, type: :model do
  context "#import" do

    it "doit retourner le bon nom" do

      user = User.new

      allow(user).to receive(:callApi).and_return('[{"name": "John doe"}, {}, {}]') # autorise au test de recevoir d'autre donné

      expect(user.import).to eq("John doe") # la methode import a été codé dans le model user, elle va retourner le premier nom de l'api

    end
  end
end
