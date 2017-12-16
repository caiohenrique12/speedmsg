class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    @send_messages = Message.where(user_id: current_user.id)
    @receive_messages = Message.where(user_receiver_id: current_user.id)
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    dependencies_message
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
    redirect_to root_path
  end

  # POST /messages
  # POST /messages.json
  def create
    dependencies_message
    @message = Message.new(message_params)
    respond_to do |format|
      if @message.save
        format.html { redirect_to messages_path, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def visualized
    message = Message.find(params[:message_id])
    unless message.message_displayed
      message.change_status
    end
  end

  def dependencies_message
    @send_users = User.list_users current_user.id
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:title, :user_id, :text, :message_displayed, :user_receiver_id, :data_displayed)
    end
end
