class ListsController < ApplicationController
  def new
    #Viewに渡すためのインスタント変数に空のオブジェクトを生成する
    @list = List.new
  end
  
  def create
    #データ受け取り作成のためのインスタンス作成
    list = List.new(list_params)
    #データベース保存のためのsaveメソッド
    list.save
    #トップ画面へリダイレクト
    redirect_to list_path(list.id)
  end
  
  def index
    @lists = List.all 
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end
  
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end
    
  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to '/lists'
  end
  
  private
  #ストロングパラメーター
  def list_params
    params.require(:list).permit(:title,:body,:image)
  end
end
