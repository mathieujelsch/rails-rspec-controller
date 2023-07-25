require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'comment association' do
    it 'doit incrémenter comments_count' do
      post = build(:post)  # on crée une instance de post sans le save (avec bot factory)

      post.comments << build(:comment)  # on lui ajoute un commentaire sans le save

      post.save # on save le tout

      expect(Comment.count).to eq(1)  # on test qu'on obtient bien 1 commetaire
      expect(post.comments_count).to eq(1)

    end

    it 'post doit persister' do

      create(:post)  # on crée un post avec factory, ca le save automatiquement
      expect(Post.count).to eq(1) # on test la persistance

    end

    after(:each) do
      Comment.destroy_all  # on doit supprimer car sinon les test eq(1) seront faux car ils s'ajoutent a chaque fois
      Post.destroy_all
    end
  end
end
