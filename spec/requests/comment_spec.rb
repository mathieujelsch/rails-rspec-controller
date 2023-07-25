require 'rails_helper'

RSpec.describe "Comments", type: :request do

  describe 'POST #create' do
    context 'invalide params' do
      before do # on fait le before car cela evite a chaque fois de recréer le post et le create pour les test

        p = create(:post)

        post :create, params: {post_id: p.id, comment: attributes_for(:comment_empty)} # ici post est une méthode donnée par rspec qui permet de d'activer la méthode créate qu'on a faite dans le controller

      end

      it 'doit retourner une erreur' do

        expect(response).to have_http_status(422) # la methode response est inclus dans rspec qui permet de savoir sur quelle status http se trouve notre requete, ici on attend l'erreur 422(requete bien recu par le serveur mais pas accessible a cause de validations non respecté)

      end

      it 'doit retourner un json avec lerreur' do

        json = JSON.parse(response.body) # on recupere la reponse http et on la parse au format json

        expect(json).to include(:content) # on attend que dans la réponse json on a une clé content:, si on l'a, le test réussira 

      end
    end
  end
end
