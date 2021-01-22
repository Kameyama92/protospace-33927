class PrototypesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :edit, :destroy]

  # 下の記述は、別のログインユーザーの編集をトップページへ促したい
  # before_action :move_to_index, except: [:edit]

  before_action :move_to_index, only: [:edit]
  # before_action :move_to_index, only: [:edit]
  # before_action :authenticate_user!, :move_to_index, only: [:edit]
  # ここまで

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
    redirect_to root_path
    else
    render :new    
    end
    end


  # def create
  #   if Prototype.create(prototype_params)
  #     redirect_to root_path
  #   else
  #   render :new
  #   end
  # end

  def edit
    @prototype = Prototype.find(params[:id])
    # def move_to_index
    # unless @prototype.user == current_user
    # redirect_to action: :index
    # end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def update
    @prototype = Prototype.find(params[:id])
    @prototype.update(prototype_params)
    if @prototype.save
    redirect_to prototype_path
    else
    render :edit   
    end


  # def update
  #   @prototype = Prototype.find(params[:id])
    
  #   if @prototype.update(prototype_params)
  #     redirect_to prototype_path method: :get
  #   else
  #   render :edit
  # end

  end

  def destroy
    if prototype = Prototype.find(params[:id])
      prototype.destroy
      redirect_to root_path
    end
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
    # ビフォアアクションに定義している記述と連携
  def move_to_index
    @prototype = Prototype.find(params[:id])
  # @user = User.find(params[:id])
  # 以下falseの場合の処理を実行.ログインしている人と、カレントユーザーを比較
    unless @prototype.user == current_user
  # インデックスアクションに飛ばしてね
    redirect_to action: :index
    end
  end 
    # ここまで

    

end
