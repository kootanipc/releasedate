class ReleasesController < ApplicationController
  def index
    @releases = Release
      .paginate(page: params[:page], per_page: 10)

    @grid_no = 1
    if params[:page].present?
      @grid_no = (params[:page].to_i - 1) * 10 + 1
    end
  end

  def show
    @release = Release.find(params[:id])
    render "show"
  end

  def new
    if params[:back]
      @release = Release.new(releases_params)
    else
      @release = Release.new
    end
  end

  def edit
    @release = Release.find(params[:id])
  end

  def create
    @release = Release.new(releases_params)
    if @release.save
      redirect_to releases_path, notice: "商品を登録しました"
    else
      render "new"
    end
  end

  def update
    @release = Release.find(params[:id])

    @release.update(releases_params)
    if @release.save
      redirect_to releases_path, notice: "商品を編集しました"
    else
      render 'new'
    end
  end

  def destroy
    @release = Release.find(params[:id])
    @release.destroy
    redirect_to releases_path, notice: "商品を削除しました"
  end

  def confirm
    @release = Release.new(releases_params)
    render :new if @release.invalid?
  end

  private
    def releases_params
      params.require(:release).permit(:name, :content, :date)
    end

    def set_release
      @release = Release.find(params[:id])
    end
end
