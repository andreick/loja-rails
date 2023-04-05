class ProdutosController < ApplicationController
  def index
    @produtos = Produto.order(nome: :desc)
    @produtos_com_desconto = Produto.order(:preco).limit(1)
  end

  def new
    @produto = Produto.new
  end

  def create
    produtoParams =
      params.require(:produto).permit(:nome, :descricao, :preco, :quantidade)
    Produto.create(produtoParams)
    redirect_to root_path
  end

  def destroy
    Produto.destroy(params[:id])
    redirect_to root_path
  end
end
