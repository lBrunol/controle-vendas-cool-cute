<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.joda.org/joda/time/tags" prefix="joda" %>
<!DOCTYPE html>
<html>
<head>
    <title>Consulta de Anúncio - Cool & Cute - Vendas</title>
    <%-- INCLUDE DO TOPO --%>
    <%@include file="/includes/topo.jsp" %>
    <style>
        .table { width: 1200px; }
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
                        <h2>Deseja realmente excluir o Anúncio?</h2>                            
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    </div>
                    <div class="modal-body">
                        <p class="modal-id"><strong>Id: </strong><span></span></p>                        
                        <p class="modal-descricao"><strong>Descrição: </strong><span></span></p>
                        <form action="/excluirAnuncio" method="POST">
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
            <li><a href="javascript:;">Anúncio</a></li>
            <li class="active">Consultar</li>
        </ol>
        <c:if test="${msg != null }">
            <div class="alert alert-danger alert-dismissible fade in" role="alert"> 
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button> 
                <i class="fa fa-fw fa-times"></i> ${msg}
            </div>
        </c:if>
        <h2>Consultar Anúncio</h2>
        <hr />
        <div class="row">
            <div class="col-md-12 text-right">
                <a role="button" href="/anuncio/criar/" class="btn btn-mais">Adicionar Anúncio +</a>
            </div>
        </div>
        <form method="GET" action="/filtrarAnuncio" id="form-consultar-anuncios">
            <div class="row">
                <div class="col-md-3 col-sm-12 form-group">
                    <label for="codigo">Código</label>
                    <input type="text" class="form-control" placeholder="Código" name="codigo" value="${anuncioFiltro.codigo == 0 ? "" : anuncioFiltro.codigo}" aria-describedby="basic-addon2" />
                </div>
                <div class="col-md-5 col-sm-12 form-group">
                    <label for="descricao">Descrição</label>
                    <input type="text" class="form-control" placeholder="Descrição" name="descricao" value="${anuncioFiltro.descricao}" aria-describedby="basic-addon2" />
                </div>
                <div class="col-md-4 col-sm-12 form-group">
                    <label for="preco">Preço</label>
                    <input type="text" class="form-control" placeholder="Preço" name="preco" value="<fmt:formatNumber type="currency" value='${anuncioFiltro.preco == 0 ? "" : anuncioFiltro.preco}' />" aria-describedby="basic-addon2" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-sm-12 form-group">
                    <label for="codigo">Data de criação</label>
                    <input type="date" class="form-control" placeholder="Data de criação" name="dataCriacao" value="<joda:format pattern="yyyy-MM-dd" value="${anuncioFiltro.dataCriacao}" />" aria-describedby="basic-addon2" />
                </div>
                <div class="col-md-5 col-sm-12 form-group">
                    <label for="statusAnuncio.descricao">Status</label>
                    <select class="form-control" name="statusAnuncio.descricao" id="statusAnuncio">
                        <option></option>
                        <c:forEach items="${statusAnuncio}" var="statusAnuncio">
                            <option value="${statusAnuncio.getDescricao()}">${statusAnuncio.getDescricao()}</option>
                        </c:forEach>
                    </select>                    
                </div>                
                <div class="col-md-4 col-sm-12 form-group">
                    <label for="tipoAnuncio.descricao">Tipo</label>
                    <select class="form-control" name="tipoAnuncio.descricao" id="tipoAnuncio">
                        <option></option>
                        <c:forEach items="${tipoAnuncio}" var="tipoAnuncio">
                            <option value="${tipoAnuncio.getDescricao()}">${tipoAnuncio.getDescricao()}</option>
                        </c:forEach>
                    </select>
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
                                    <th>Data de Criação</th>
                                    <th>Status</th>
                                    <th>Tipo</th>
                                    <th>Ações</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:if test="${anuncio != null}">
                                    <c:forEach items="${anuncio}" var="anuncio">
                                        <tr>
                                            <td data-id="${anuncio.codigo}">${anuncio.codigo}</td>
                                            <td data-descricao="${anuncio.descricao}">${anuncio.descricao}</td>
                                            <td><fmt:formatNumber type="currency" value="${anuncio.preco}" /></td>
                                            <td><joda:format pattern="dd/MM/yyyy" value="${anuncio.dataCriacao}" /></td>
                                            <td>${anuncio.statusAnuncio.descricao}</td>
                                            <td>${anuncio.tipoAnuncio.descricao}</td>
                                            <td>
                                                <a href="/consultarAnuncioItem/${anuncio.codigo}" class="btn btn-pequeno btn-warning" role="button"><i class="fa fa-fw fa-pencil-square-o"></i> Editar</a>
                                                <button type="button" class="btn btn-pequeno btn-vermelho btn-excluir" data-target=".modal-excluir" data-toggle="modal"><i class="fa fa-trash fa-fw"></i> Excluir</button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${anuncio == null}">
                                    <tr class="no-paginate">
                                        <td colspan="7">Por favor, faça uma pesquisa ou entre com argumentos válidos.</td>
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
        
        <c:if test="${(anuncioFiltro.statusAnuncio.descricao != null) && (anuncioFiltro.statusAnuncio.descricao != '')}">
            selectValorDropdownList('${anuncioFiltro.statusAnuncio.descricao}', 'statusAnuncio', true);
        </c:if>
            
        <c:if test="${(anuncioFiltro.tipoAnuncio.descricao != null) && (anuncioFiltro.tipoAnuncio.descricao != '')}">
            selectValorDropdownList('${anuncioFiltro.tipoAnuncio.descricao}', 'tipoAnuncio', true);            
        </c:if>
            
    </script>            
</body>
</html>