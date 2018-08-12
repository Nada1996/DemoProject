class NoktaController < ApplicationController
  before_action :set_noktum, only: [:show, :edit, :update, :destroy]

  #,:upvote, :downvote

  def upvote
    @noktum = Noktum.find(params[:id])
    @noktum.upvote_by current_user
    respond_to do |format|
      format.html {redirect_back fallback_location: root_path }
      format.js
    end
    #redirect_to :back

  end

  def downvote
    @noktum = Noktum.find(params[:id])
    @noktum.downvote_by current_user
    redirect_back fallback_location: root_path
  end

  # GET /nokta
  # GET /nokta.json
  def index
    @nokta =Noktum.where(hidden: false).paginate(:per_page => 5, :page => params[:page])
    #Noktum.paginate(:per_page => 2, :page => params[:page])
    #Noktum.all
    #.where(hidden_state: false)
  end

  # GET /nokta/1
  # GET /nokta/1.json
  def show
  end

  # GET /nokta/new
  def new
    @noktum = current_user.nokta.build
    #Noktum.new   current_user.nokta.build
  end

  # GET /nokta/1/edit
  def edit
  end

  # POST /nokta
  # POST /nokta.json
  def create
    @noktum = current_user.nokta.build(noktum_params)
    respond_to do |format|
      if @noktum.save
        format.html { redirect_to @noktum, notice: 'Noktum was successfully created.' }
        format.js
      else
        format.html { render :new }
      end
    end

  end

  # PATCH/PUT /nokta/1
  # PATCH/PUT /nokta/1.json
  def update

    respond_to do |format|
      if @noktum.update(noktum_params)
        format.html { redirect_to @noktum, notice: 'Noktum was successfully updated.' }
        format.json { render :show, status: :ok, location: @noktum }
      else
        format.html { render :edit }
        format.json { render json: @noktum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nokta/1
  # DELETE /nokta/1.json
  def destroy
    @noktum.destroy
    respond_to do |format|
      format.html { redirect_to nokta_url, notice: 'Noktum was successfully destroyed.' }
      format.js
      #format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_noktum
      @noktum = Noktum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def noktum_params
      params.require(:noktum).permit(:body)
    end
end
