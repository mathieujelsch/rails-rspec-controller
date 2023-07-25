require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'validation' do
    it 'doit valider la longueur du text' do

      comment = build(:comment_empty)  # on créé un commentaire vide, on sattend a ce qu'il soit faux car on a donné une validation de longueur

      comment.validate  # est une methode rspec qui permet de vérifier en amont toutes les validations avant de le save

      expect(comment.errors.messages).to include(:content)  # comment.validate permet d'utiliser .errors.messages ce qui permettra de vérifier si on a un message d'erreur après la validation
      expect(comment.valid?).to be false
    end

    it 'doit accepter un bon contenu' do

      post = create(:post) # on crée un poste qui est save
      comment = build(:comment, post: post)  # on crée un commentaire qui lui sera associé, le post: correspond au post_id

      comment.validate
      expect(comment.valid?).to be true

    end
  end
end
