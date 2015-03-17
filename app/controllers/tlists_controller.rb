class TlistsController < ApplicationController
  before_action :set_tlist, only: [:show, :edit, :update, :destroy]

  # GET /tlists
  # GET /tlists.json
  def index
    @tlists = Tlist.order("position")
  end

  # GET /tlists/1
  # GET /tlists/1.json
  def show
  end

  # GET /tlists/new
  def new
    @tlist = Tlist.new
  end

  # GET /tlists/1/edit
  def edit
  end

  # POST /tlists
  # POST /tlists.json
  def create
    @tlist = Tlist.new(tlist_params)

    respond_to do |format|
      if @tlist.save
        format.html { redirect_to @tlist, notice: 'Tlist was successfully created.' }
        format.json { render :show, status: :created, location: @tlist }
      else
        format.html { render :new }
        format.json { render json: @tlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tlists/1
  # PATCH/PUT /tlists/1.json
  def update
    respond_to do |format|
      if @tlist.update(tlist_params)
        format.html { redirect_to @tlist, notice: 'Tlist was successfully updated.' }
        format.json { render :show, status: :ok, location: @tlist }
      else
        format.html { render :edit }
        format.json { render json: @tlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tlists/1
  # DELETE /tlists/1.json
  def destroy
    @tlist.destroy
    respond_to do |format|
      format.html { redirect_to tlists_url, notice: 'Tlist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def sort   
 
    params[:tlist].each_with_index do |id, index|      
      Tlist.update(id, { position: index+1})      
    end

    render nothing: true  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tlist
      @tlist = Tlist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tlist_params
      params.require(:tlist).permit(:title, :position)
    end
end
