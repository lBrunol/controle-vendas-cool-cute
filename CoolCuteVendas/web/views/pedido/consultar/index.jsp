<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.joda.org/joda/time/tags" prefix="joda" %>
<!DOCTYPE html>
<html>
<head>
    <title>Consulta de Pedido - Cool & Cute - Vendas</title>
    <%-- INCLUDE DO TOPO --%>
    <%@include file="/includes/topo.jsp" %>
    <style>
        .table { width: 1600px; }
    </style>
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
                        <h2>Deseja realmente excluir o Pedido?</h2>                            
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    </div>
                    <div class="modal-body">
                        <p class="modal-id"><strong>Id: </strong><span></span></p>                        
                        <p class="modal-descricao"><strong>Descrição: </strong><span></span></p>
                        <form action="javascript:void(0);" method="POST">
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
            <li><a href="javascript:;">Pedido</a></li>
            <li class="active">Consultar</li>
        </ol>
        <c:if test="${msg != null }">
            <div class="alert alert-danger alert-dismissible fade in" role="alert"> 
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button> 
                <i class="fa fa-fw fa-times"></i> ${msg}
            </div>
        </c:if>
        <h2>Consultar Pedido</h2>
        <hr />
        <div class="row">
            <div class="col-md-12 text-right">
                <a role="button" href="/pedido/criar/" class="btn btn-mais">Adicionar Pedido +</a>
            </div>
        </div>
        <form method="GET" action="/filtrarPedido" id="form-consultar-pedidos">
            <div class="row">
                <div class="col-md-3 col-sm-12 form-group">
                    <label for="codigo">Código</label>
                    <input type="text" class="form-control" placeholder="Código" name="codigo" value="${pedidoFiltro.codigo == 0 ? "" : pedidoFiltro.codigo}" aria-describedby="basic-addon2" />
                </div>
                <div class="col-md-5 col-sm-12 form-group">
                    <label for="dataVenda">Data da venda</label>
                    <input type="date" class="form-control" placeholder="Data da venda" name="dataVenda" value="${pedidoFiltro.dataVenda}" aria-describedby="basic-addon2" />
                </div>
                <div class="col-md-4 col-sm-12 form-group">
                    <label for="dataPostagem">Data da postagem</label>
                    <input type="date" class="form-control" placeholder="Data da postagem" name="dataPostagem" value="${pedidoFiltro.dataPostagem}" aria-describedby="basic-addon2" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-sm-12 form-group">
                    <label for="dataEntrega">Data de entrega</label>
                    <input type="date" class="form-control" placeholder="Data de entrega" name="dataEntrega" value="${pedidoFiltro.dataEntrega}" aria-describedby="basic-addon2" />
                </div>
                <div class="col-md-5 col-sm-12 form-group">
                    <label for="statusPedido.descricao">Status</label>
                    <select class="form-control" name="statusPedido.descricao" id="statusPedido">
                        <option></option>
                        <c:forEach items="${statusPedido}" var="statusPedido">
                            <option value="${statusPedido.getDescricao()}">${statusPedido.getDescricao()}</option>
                        </c:forEach>
                    </select>                    
                </div>                
                <div class="col-md-4 col-sm-12 form-group">
                    <label for="tipoAvaliacao.descricao">Avaliação</label>
                    <select class="form-control" name="tipoAvaliacao.descricao" id="tipoAvaliacao">
                        <option></option>
                        <c:forEach items="${tipoAvaliacao}" var="tipoAvaliacao">
                            <option value="${tipoAvaliacao.getDescricao()}">${tipoAvaliacao.getDescricao()}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-sm-12 form-group">
                    <label for="cliente.nome">Nome do Cliente</label>
                    <input type="text" class="form-control" placeholder="Nome do Cliente" name="cliente.nome" value="${pedidoFiltro.cliente.nome}" aria-describedby="basic-addon2" />
                </div>
                <div class="col-md-5 col-sm-12 form-group">
                    <label for="cliente.email">E-mail do Cliente</label>
                    <input type="text" class="form-control" placeholder="Nome do Cliente" name="cliente.email" value="${pedidoFiltro.cliente.email}" aria-describedby="basic-addon2" />
                </div>
                <div class="col-md-4 col-sm-12 form-group">
                    <label for="anuncio.descricao">Anúncio</label>
                    <input type="text" class="form-control" placeholder="Anúncio" name="anuncio.descricao" value="${pedidoFiltro.anuncio.descricao}" aria-describedby="basic-addon2" />
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
                                    <th>Data Venda</th>
                                    <th>Data Postagem</th>
                                    <th>Data Entrega</th>
                                    <th>Status</th>
                                    <th>Avaliação</th>
                                    <th>Nome do Cliente</th>
                                    <th>E-mail do Cliente</th>
                                    <th>Anúncio</th>
                                    <th>Ações</th>
                                </tr>
                            </thead>
                            <c:set var="now" value="<%= java.util.Calendar.getInstance().getTime()%>" />
                            <tbody>
                                <c:if test="${pedido != null}">
                                    <c:forEach items="${pedido}" var="pedido">
                                        <tr>
                                            <td data-id="${pedido.codigo}"><a href="/consultarPedidoItem/${pedido.codigo}">${pedido.codigo}</a></td>
                                            <td><joda:format pattern="dd/MM/yyyy" value="${pedido.dataVenda}" /></td>
                                            <td><joda:format pattern="dd/MM/yyyy" value="${pedido.dataPostagem}" /></td>
                                            <td><joda:format pattern="dd/MM/yyyy" value="${pedido.dataEntrega}" /></td>
                                            <td>${pedido.statusPedido.descricao}</td>
                                            <td>${pedido.tipoAvaliacao.descricao}</td>
                                            <td>${pedido.cliente.nome}</td>
                                            <td>${pedido.cliente.email}</td>
                                            <td>${pedido.anuncio.descricao}</td>
                                            <td>
                                                <a href="/consultarPedidoItem/${pedido.codigo}" class="btn btn-pequeno btn-warning" role="button"><i class="fa fa-fw fa-pencil-square-o"></i> Editar</a>
                                                <!--<button type="button" class="btn btn-pequeno btn-vermelho btn-excluir" data-target=".modal-excluir" data-toggle="modal"><i class="fa fa-trash fa-fw"></i> Excluir</button>-->
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${pedido == null}">
                                    <tr class="no-paginate">
                                        <td colspan="10">Por favor, faça uma pesquisa ou entre com argumentos válidos.</td>
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
        
        <c:if test="${(pedidoFiltro.statusPedido.descricao != null) && (pedidoFiltro.statusPedido.descricao != '')}">
            selectValorDropdownList('${pedidoFiltro.statusPedido.descricao}', 'statusPedido', true);
        </c:if>
            
        <c:if test="${(pedidoFiltro.tipoAvaliacao.descricao != null) && (pedidoFiltro.tipoAvaliacao.descricao != '')}">
            selectValorDropdownList('${pedidoFiltro.tipoAvaliacao.descricao}', 'tipoAvaliacao', true);            
        </c:if>
            
    </script>            
</body>
</html>