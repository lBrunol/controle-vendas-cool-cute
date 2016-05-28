<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Consulta de Produto - Cool & Cute - Vendas</title>
    <%-- INCLUDE DO TOPO --%>
    <%@include file="/includes/topo.jsp" %>
</head>
<body>
    <%-- INCLUDE DO MENU --%>
    <%@include file="/includes/menu.jsp" %>
    <!-- CONTEÚDO -->
    <div class="container content">
        <!-- MODAIS -->
        <!-- MODAL EXCLUIR -->
        <div class="modal modal-excluir fade" tabindex="-1" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h2>Deseja realmente excluir o Produto?</h2>                            
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    </div>
                    <div class="modal-body">
                        <p class="modal-id"><strong>Id: </strong><span></span></p>                        
                        <p class="modal-descricao"><strong>Descrição: </strong><span></span></p>
                        <form action="/excluirProduto" method="POST">
                            <input type="hidden" name="codigo" id="hdnCodigo" value="" />
                            <button type="submit" class="btn btn-salvar margin-std-right margin-std-top"><i class="fa fa-fw fa-check"></i> Confirmar</button>
                            <button type="button" class="btn btn-vermelho margin-std-top" data-dismiss="modal"><i class="fa fa-fw fa-chevron-left"></i> Voltar</button>
                        </form>
                    </div>
                    <div class="modal-footer">

                    </div>
                </div>
            </div>
        </div>      

        <!--BreadCrumbs-->
        <ol class="breadcrumb">
            <li><a href="/">Início</a></li>
            <li><a href="javascript:;">Produto</a></li>
            <li class="active">Consultar</li>
        </ol>
        <c:if test="${msg != null }">
            <div class="alert alert-danger alert-dismissible fade in" role="alert"> 
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button> 
                <i class="fa fa-fw fa-times"></i> ${msg}
            </div>
        </c:if> 
        <h2>Consultar Produto</h2>
        <hr />
        <div class="row">
            <div class="col-md-12 text-right">
                <a role="button" href="/produto/criar/" class="btn btn-mais">Adicionar Produto +</a>
            </div>
        </div>
        <form method="GET" action="/filtrarProduto" id="form-consultar-produtos">
            <div class="row">
                <div class="col-md-4 col-sm-12 form-group">
                    <label for="codigo">Código</label>
                    <input type="text" class="form-control" placeholder="Código" name="codigo" aria-describedby="basic-addon2" />
                </div>
                <div class="col-md-8 col-sm-12 form-group">
                    <label for="nome">Nome</label>
                    <input type="text" class="form-control" placeholder="Nome" name="nome" aria-describedby="basic-addon2" />
                </div> 
            </div>
            <div class="row">
                <div class="col-md-4 col-sm-12 form-group">
                    <label for="preco">Preço</label>
                    <input type="text" class="form-control" placeholder="Preço" name="preco" aria-describedby="basic-addon2" />
                </div>
                <div class="col-md-8 col-sm-12 form-group">
                    <label for="quantidade">Quantidade</label>
                    <input type="text" class="form-control" placeholder="Quantidade" name="quantidade" aria-describedby="basic-addon2" />
                </div> 
            </div>
            <div class="row">
                <div class="col-md-2 col-sm-2 form-group">
                    <button type="submit" id="btnPesquisar" class="btn btn-salvar">Buscar <i class="fa fa-fw fa-search"></i></button>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tabela-overflow">
                        <table class="table table-pagination margin-std-top">
                            <thead>
                                <tr>
                                    <th>Código</th>
                                    <th>Descrição</th>
                                    <th>Preço</th>
                                    <th>Estoque Mínimo</th>
                                    <th>Quantidade</th>
                                    <th>Ações</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:if test="${produto != null}">
                                    <c:forEach items="${produto}" var="produto">
                                        <tr>
                                            <td data-id="${produto.codigo}">${produto.codigo}</td>
                                            <td data-descricao="${produto.nome}">${produto.nome}</td>
                                            <td>${produto.preco}</td>
                                            <td>${produto.estoqueMinimo}</td>
                                            <td>${produto.quantidade}</td>
                                            <td>
                                                <a href="/consultarProdutoItem/${produto.codigo}" class="btn btn-pequeno btn-warning" role="button"><i class="fa fa-fw fa-pencil-square-o"></i> Editar</a>
                                                <button type="button" class="btn btn-pequeno btn-vermelho btn-excluir" data-target=".modal-excluir" data-toggle="modal"><i class="fa fa-trash fa-fw"></i> Excluir</button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${produto == null}">
                                    <tr class="no-paginate">
                                        <td colspan="3">Por favor, faça uma pesquisa ou entre com argumentos válidos.</td>
                                    </tr>
                                </c:if>
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
                                
                            </ul>
                        </nav>
                    </div>
                </div>                    
            </div>
        </form>
    </div>
    <%-- INCLUDE DO RODAPÉ --%>
    <%@include file="/includes/rodape.jsp" %>   
    <script type="text/javascript" src="/js/paginacao.js"></script>
    <script type="text/javascript">
        $(function () {
            
            //Ação de exclusão
            $('.btn-excluir').click(function(){
                var id = $(this).closest('tr').find('td[data-id]').attr('data-id');
                var descricao = $(this).closest('tr').find('td[data-descricao]').attr('data-descricao');
                
                $('.modal-excluir .modal-id span').html(id);
                $('.modal-excluir .modal-descricao span').html(descricao);
                $('.modal-excluir #hdnCodigo').val(id);
            });
            
            paginacao('.table-pagination', '.pagination', 10);
             
        });
    </script>            
</body>
</html>