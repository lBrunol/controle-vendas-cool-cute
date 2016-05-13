<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Consulta de Pedidos - Cool & Cute - Vendas</title>
    <%-- INCLUDE DO TOPO --%>
    <%@include file="/includes/topo.jsp" %>
</head>
<body>
    <%-- INCLUDE DO MENU --%>
    <%@include file="/includes/menu.jsp" %>
    <!-- CONTEÚDO -->
    <div class="container content">
        <h2>Consultar Pedidos</h2>
        <hr>

         <h3>Selecione o Filtro:</h3>
        <form method="post" action="javascript:void(0);" id="form-consultar-clientes">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-filtro">
                        <div class="panel-body">                                
                            <div class="col-md-4 col-xs-12">
                                <label class="control-label radio-check label-checkbox">
                                    <input type="radio" value="dataVenda" name="rdbFiltro" id="rdbDataVenda" />
                                    Data da Venda
                                </label>
                            </div>
                            <div class="col-md-4 col-xs-12">
                                <label class="control-label radio-check label-checkbox">
                                    <input type="radio" value="clietne" name="rdbFiltro" id="rdbCliente" />
                                    Cliente
                                </label>
                            </div> 
                            <div class="col-md-4 col-xs-12">
                                <label class="control-label radio-check label-checkbox">
                                    <input type="radio" value="anuncio" name="rdbFiltro" id="rdbAnuncio" />
                                    Anúncio
                                </label>
                            </div>                                 
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Filtro por: Descrição" aria-describedby="basic-addon2" id="txtPesquisa" />
                        <span class="input-group-btn"><a role="button" href="/consultarTipoAnuncio" id="btnPesquisar" class="btn btn-salvar"><i class="fa fa-fw fa-search"></i></a></span>
                    </div>
                </div>
            </div>             
            <div class="row">
                <div class="col-md-12">
                    <div class="tabela-overflow">
                        <table class="table margin-std-top">
                            <thead>
                                <tr>
                                    <th>Anúncio</th>
                                    <th>Açoes</th>
                                  
                                </tr>
                            </thead>
                            <tbody>
                                
                                    <tr>
                                        <td>Mochila Azul</td>
                                        <td>
                                            <a href="/consultarTipoAnuncioItem/${tipoAnuncio.codigo}" class="btn btn-pequeno btn-warning" role="button"><i class="fa fa-fw fa-pencil-square-o"></i> Editar</a>
                                            <button type="button" class="btn btn-pequeno btn-vermelho btn-excluir" data-target=".modal-excluir" data-toggle="modal"><i class="fa fa-trash fa-fw"></i> Excluir</button>
                                        </td>
                                    </tr>
                                                                                                   
                            </tbody>                               
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="text-center">
                        <nav>
                            <ul class="pagination pagination-cool">
                                <li>
                                    <a href="#" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                    </li>
                                    <li class="active"><a href="#">1</a></li>
                                    <li><a href="#">2</a></li>
                                    <li><a href="#">3</a></li>
                                    <li><a href="#">4</a></li>
                                    <li><a href="#">5</a></li>
                                    <li>
                                    <a href="#" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>                    
            </div>
        </form>
    </div>
    <%-- INCLUDE DO RODAPÉ --%>
    <%@include file="/includes/rodape.jsp" %>    
</body>
</html>