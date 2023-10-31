class GossipsController < ApplicationController
 # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
  def show
    @gossip = Gossip.find(params[:id])
  end

  # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
  def index
    @gossips = Gossip.all
  end

  def new
    # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
    @gossip = Gossip.new
  end

  def create
    puts "$" * 60
    puts "ceci est le contenu de params :"
    puts params
    puts "$" * 60

    @gossip = Gossip.new(content: params[:content], title: params[:title], user_id: User.all.sample.id)
    puts @gossip.title
    if @gossip.save
      redirect_to "/gossips"
    else
       # Afficher les erreurs en cas d'échec
      puts "$" * 60
      puts "Erreurs de validation :"
      puts @gossip.errors.full_messages
      puts "$" * 60
      render "/gossips/new"
    end
  end

  def edit
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
  end

  def update
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
  end

  def destroy
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
  end

end

