class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  # GET /images
  # GET /images.json
  def index
    @images = Image.all
  end

  # GET /images/1
  # GET /images/1.json
  def show
    puts "SHOOOOOOOOOOOOOOOOOOOOW"
    @imgHtml = "/img/"+@image.code+".jpg"
    File.open("public/img/"+@image.code+".jpg", 'wb') do |f|
      f.write @image.file
    end
  end

  # GET /images/new
  def new
    puts "NEEEEEEEEEEEEEEEEEEEEEEEW"
    @image = Image.new
  end

  def concatImageRoute(code)
    @jpg = ".jpg"
    @img = "/img/"
    return @img+code+@jpg
  end
  helper_method :concatImageRoute

  # GET /images/1/edit
  def edit
  end

  # POST /images
  # POST /images.json
  def create
    @image = Image.new(image_params)
    respond_to do |format|
      #if @image.save
      if @image.file.length > 0
        data = File.read(@image.file)
        Image.create file: data, name: @image.name , code:@image.code  

        File.open("public/img/"+@image.code+".jpg", 'wb') do |f|
          f.write data
        end

        format.html { redirect_to @image, notice: 'Image was successfully created.' }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update

    puts "UPDAAAAAAAAAAAAATE"
    data = File.read(image_params[:file])
    image_params_clone = image_params.clone
    image_params_clone[:file] = data


    respond_to do |format|
      if @image.update(image_params_clone)
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        format.json { render :show, status: :ok, location: @image }
      else
        format.html { render :edit }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url, notice: 'Image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:code, :name, :file)
    end
end
