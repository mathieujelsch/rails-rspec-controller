require 'rails_helper'

RSpec.describe CommentController, type: :controller do

  let(:p) { create(:post) }  # methode let de rspec permet d'utiliser le post p pour tous nos test

  describe 'POST #create' do
    context 'invalide params' do
      before do # on fait le before car cela evite a chaque fois de recréer le post et le create pour les test

        # p = create(:post)

        post :create, params: {post_id: p.id, comment: attributes_for(:comment_empty)} # ici post est une méthode donnée par rspec qui permet de d'activer la méthode créate qu'on a faite dans le controller

      end

      it 'doit retourner une erreur' do

        expect(response).to have_http_status(422) # la methode response est inclus dans rspec qui permet de savoir sur quelle status http se trouve notre requete, ici on attend l'erreur 422(requete bien recu par le serveur mais pas accessible a cause de validations non respecté)

      end

      it 'doit retourner un json avec lerreur' do

        json = JSON.parse(response.body) # on recupere la reponse http et on la parse au format json

        expect(json).to include('content') # on attend que dans la réponse json on a une clé content:, si on l'a, le test réussira

      end
    end

    context 'valid params'do
      before do

        # p = create(:post)

        post :create, params: {post_id: p.id, comment: attributes_for(:comment)} # ici on refait un create avec un commentaire valide

      end

      it 'doit retourner 200' do

        expect(response).to have_http_status(200) # l'erreur 200 n'est pas une erreur, 200 signifie que la requete a fonctionné

      end

      it 'doit retourner un json avec le commentaire' do

        json = JSON.parse(response.body) # on recupere la reponse http et on la parse au format json

        expect(json).to include('content') # on attend que dans la réponse json on a une clé content:, si on l'a, le test réussira
        expect(json).to include('id') # on test aussi sur l'id
      end

      it 'comment doit persister' do

        expect(Comment.count).to eq(1)

      end

      it 'commentaire doit etre rattaché au bon post' do

        expect(p.comments.count).to eq(1) # on vérifie que notre instance de post a bien un commentaire rattaché en gros on test la ligne render json: @comment du comment controller

      end

      after(:each) do
        Comment.destroy_all  # on doit supprimer car sinon les test eq(1) seront faux car ils s'ajoutent a chaque fois
        Post.destroy_all
      end
    end
  end
end
