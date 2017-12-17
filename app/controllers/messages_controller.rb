class MessagesController < ApplicationController
  before_action :set_message, only: [:show]

  # GET /messages
  # GET /messages.json
  def inbox
    @receive_messages = Message.where(user_receiver_id: current_user.id, archive: false).order(created_at: :desc)
  end

  def sent
    @send_messages = Message.where(user_id: current_user.id, archive: false).order(created_at: :desc)
  end

  def archives
    @archives = Message.where(archive: true).order(created_at: :desc)
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    visualized
  end

  # GET /messages/new
  def new
    dependencies_message
    @message = Message.new
  end

  # POST /messages
  # POST /messages.json
  def create
    dependencies_message
    @message = Message.new(message_params)
    respond_to do |format|
      if @message.save
        format.html { redirect_to inbox_messages_path, notice: 'Messagem Enviada com Sucesso.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def archive
    if params[:messages]
      params[:messages].each do |id|
        message = Message.find(id.to_i)
        unless message.archive
          message.archive_message
        end
      end

      params[:messages].count > 1 ? texto = "Mensagens" : texto = "Mensagem"

      if params[:action_origin] == "inbox_message"
        redirect_to :inbox_messages, notice: "#{texto} Arquivada com Sucesso."
      else
        redirect_to :sent_messages, notice: "#{texto} Arquivada com Sucesso."
      end
    else
      if params[:action_origin] == "inbox_message"
        redirect_to :inbox_messages, notice: "Escolha uma mensagem para arquivar."
      else
        redirect_to :sent_messages, notice: "Escolha uma mensagem para arquivar."
      end
    end
  end

  def dependencies_message
    @send_users = User.list_users current_user.id
  end

  private

    def visualized
      unless @message.displayed
        @message.change_status
      end
    end

    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:title, :user_id, :text, :displayed, :user_receiver_id, :date_view)
    end
end
