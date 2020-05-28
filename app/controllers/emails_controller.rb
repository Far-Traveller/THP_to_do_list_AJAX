class EmailsController < ApplicationController

  def index
    @emails = Email.all
    @email = Email.new
  end

  def create
    @email =  Email.create(object: Faker::Games::Zelda.game, body: Faker::Movies::HarryPotter.quote)
    respond_to do |format|
      format.html {
        flash[:notice] = "Email created"
        redirect_to emails_path
      }
      format.js { }
    end
  end

  def show
    @email = Email.find(params[:id])
    respond_to do |format|
      format.html { redirect_to email_path(@email.id) }
      format.js {}
    end
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js {}
    end
  end

end
