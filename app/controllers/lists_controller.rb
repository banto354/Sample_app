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
    redirect_to '/top'
  end
  
  def index
  end

  def show
  end

  def edit
  end
  
  private
  #ストロングパラメーター
  def list_params
    params.require(:list).permit(:title,:body)
  end
end
