class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    if @message.valid?
      MessageMailer.contact_form(@message).deliver
      flash[:notice] = "¡Mensaje Enviado!, gracias por contactarnos."
      redirect_to new_message_path
    else
      render :action => 'new'
    end
  end
end

