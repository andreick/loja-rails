class ProdutosController < ApplicationController
  def index
    @produtos = Produto.order(nome: :desc)
    @produtos_com_desconto = Produto.order(:preco).limit(1)
  end

  def new
    @produto = Produto.new
  end

  def create
    produto_params =
      params.require(:produto).permit(:nome, :descricao, :preco, :quantidade)
    @produto = Produto.new(produto_params)
    if @produto.save
      flash[:notice] = "Produto #{@produto.nome} criado com sucesso!"
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    Produto.destroy(params[:id])
    redirect_to root_path
  end

  def search
    @produtos = Produto.where("nome LIKE ?", "%#{params[:nome]}%")
  end
end
