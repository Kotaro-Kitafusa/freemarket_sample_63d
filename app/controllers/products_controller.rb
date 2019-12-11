class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :category_select_function, only: [:new, :create, :edit, :update]

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    @product.product_images.build

    # 配送者によって配送方法の選択肢を変化させる。
  end


  def create
    brand = Brand.create(name: params.require(:product)[:brand])
    category = Category.find_by(name: params.require(:product)[:category])
    product_params = product_parameter.merge(
      brand_id: brand.id,
      category_id: category.id,
      user_profile_id: current_user.user_profile.id
    )
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        params[:product_images][:image].each do |image|
          @product.product_images.create(image: image, product_id: @product.id)
        end
        format.html{redirect_to root_path}
      else
        @product.product_images.build
        format.html{render :new}
      end
    end
  end

  # 以下全て、formatはjsonのみ
  # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  # 配送料の負担が選ばれた後のアクション
  def get_shipping_method
  end

  #出品に必要なデータ型の指定
  def product_parameter
    #最後に、.merge(user_id: current_user.id)をユーザー設定終わったらつける
    params.require(:product).permit(
      :name, :description, :status, :who_charge_shipping,
      :way_of_shipping, :shipping_region, :how_long_shipping, :price,
      product_images_attributes: [:image]
    )
  end

  #カテゴリー選択機能
  def category_select_function
    #セレクトボックスの初期値設定
    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

end
