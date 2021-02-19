require 'twilio-ruby'
class LeadsController < ApplicationController
  before_action :set_lead, only: %i[ show edit update destroy ]
  protect_from_forgery with: :null_sessions

  # GET /leads or /leads.json
  def index
    @leads = Lead.all
  end

  # GET /leads/1 or /leads/1.json
  def show
  end

  # GET /leads/new
  def new
    @lead = Lead.new
  end

  # GET /leads/1/edit
  def edit
  end

  # POST /leads or /leads.json
  def create
    @lead = Lead.new(first_name: lead_params["first_name"], last_name: lead_params["last_name"], phone_number: lead_params["phone_number"])
    @lead.date_texted = DateTime.now.getlocal
    
    respond_to do |format|
      if @lead.save
        format.html { redirect_to root_path, notice: "New Lead '" + @lead.first_name + " " + @lead.last_name+ "' was successfully created." }
        notify(lead_params["message"], @lead.phone_number)
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leads/1 or /leads/1.json
  def update
    respond_to do |format|
      if @lead.update(lead_params)
        format.html { redirect_to @lead, notice: "Lead was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leads/1 or /leads/1.json
  def destroy
    @lead.destroy
    respond_to do |format|
      format.html { redirect_to leads_url, notice: "Lead was successfully destroyed." }
    end
  end

  private
    def set_lead
      @lead = Lead.find(params[:id])
    end

    def lead_params
      params.require(:lead).permit(:first_name, :last_name, :phone_number, :message)
    end
      # TWILIO SMS integration method for dispatching texts
    def notify(custom_message, phone_number)
      account_sid = ENV['TWILIO_ACCOUNT_SID']
      auth_token = ENV['TWILIO_AUTH_TOKEN']
      client = Twilio::REST::Client.new(account_sid, auth_token)
      message = client.messages.create from: ENV['TWILIO_PHONE_NUMBER'], to: '+1' + phone_number, body: custom_message
    end

end
