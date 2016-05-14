<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Consulta de Clientes - Cool & Cute - Vendas</title>
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
                        <h2>Deseja realmente excluir o cliente?</h2>                            
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    </div>
                    <div class="modal-body">
                        <p class="modal-id"><strong>Id: </strong><span></span></p>                        
                        <p class="modal-descricao"><strong>Nome: </strong><span></span></p>
                        <form action="/excluirCliente" method="POST">
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
            <li><a href="javascript:;">Clientes</a></li>
            <li class="active">Consultar</li>
        </ol>
        <c:if test="${msg != null }">
            <div class="alert alert-danger alert-dismissible fade in" role="alert"> 
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button> 
                <i class="fa fa-fw fa-times"></i> ${msg}
            </div>
        </c:if> 
        <h2>Consultar Cliente</h2>
        <hr />
        <div class="row">
            <div class="col-md-12 text-right">
                <a role="button" href="/cliente/criar/" class="btn btn-mais">Adicionar Cliente +</a>
            </div>
        </div>
        <h3>Selecione o Filtro:</h3>
        <form method="post" action="/filtrarCliente" id="form-consultar-clientes">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-filtro">
                        <div class="panel-body">                                
                            <div class="col-md-6 col-xs-12">                               
                                <label class="control-label radio-check label-checkbox">
                                    <input type="radio" checked value="Nome" class="radioFiltro" name="rdbFiltro" id="rdbNome" />
                                    Nome
                                </label>
                            </div>
                            <div class="col-md-6 col-xs-12">
                                <label class="control-label radio-check label-checkbox">
                                    <input type="radio" value="Email" class="radioFiltro" name="rdbFiltro" id="rdbEmail" />
                                    Email
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Nome" name="nome" aria-describedby="basic-addon2" id="txtPesquisa" />
                        <span class="input-group-btn"><button type="submit" id="btnPesquisar" class="btn btn-salvar"><i class="fa fa-fw fa-search"></i></button></span>
                    </div>
                </div>
            </div>             
            <div class="row">
                <div class="col-md-12">
                    <div class="tabela-overflow">
                        <table class="table margin-std-top">
                            <thead>
                                <tr>
                                    <th>Código</th>
                                    <th>Nome</th>
                                    <th>E-mail</th>
                                    <th>Ações</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${cliente}" var="cliente">
                                    <tr>
                                        <td data-id="${cliente.codigo}">${cliente.codigo}</td>
                                        <td data-descricao="${cliente.nome}">${cliente.nome}</td>
                                        <td>${cliente.email}</td>
                                        <td>
                                            <a href="/consultarClienteItem/${cliente.codigo}" class="btn btn-pequeno btn-warning" role="button"><i class="fa fa-fw fa-pencil-square-o"></i> Editar</a>
                                            <button type="button" class="btn btn-pequeno btn-vermelho btn-excluir" data-target=".modal-excluir" data-toggle="modal"><i class="fa fa-trash fa-fw"></i> Excluir</button>
                                        </td>
                                    </tr>
                                </c:forEach>                                    
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
                                <!--<li>
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
                                </li>-->
                            </ul>
                        </nav>
                    </div>
                </div>                    
            </div>
        </form>
    </div>
    <%-- INCLUDE DO RODAPÉ --%>
    <%@include file="/includes/rodape.jsp" %>   
    
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
            
            
            $('input[type="radio"]').on('change', function() {
                $('#txtPesquisa').attr({
                    name: $('input[type="radio"]:checked').val().toLowerCase(),
                    placeholder: $('input[type="radio"]:checked').val()
                }).focus();
             });
             
            
             
             var paginacao = function(itens, elPaginacao, numPorPagina){
                 
                if(typeof itens === 'undefined'){
                    itens = '.table';
                }
                if(typeof elPaginacao === 'undefined'){
                    elPaginacao = '.pagination';
                }
                if(typeof numPorPagina === 'undefined'){
                    numPorPagina = 10;
                }
                
                var qtdeItens = $(itens + ' tbody tr').length;
                var paginacaoAtual = 0;
                var inicioPaginacao = 0;  
                var ultimoIndicePaginacao = 0;

                var init = function (){
                    
                    if($(itens + ' tbody tr').length > 0){
                        $(itens + ' tbody tr').hide();
                         paginar();
                    } else {
                        $(elPaginacao).hide();
                    }
                    
                };
                var paginar = function (){
                    criarItens();
                    mostrarItens();
                };
                var mostrarItens = function () {
                    
                    $(itens + ' tbody tr').hide();
                    $(itens + ' tbody tr').each(function (index) {
                        if(index >= inicioPaginacao && index < (inicioPaginacao + numPorPagina)){
                            $(this).show();
                        } else {
                            return;
                        }
                    });                            
                };
                var criarItens = function (){
                    
                    var indiceItensPaginacao = 1;
                    var htmlItensPaginacao = '<li><a href="javascript:;" class="pagination-anterior"><span aria-hidden="true">«</span></a></li>';
                    $(elPaginacao).append(htmlItensPaginacao);
                    
                    for (i = 0; i < qtdeItens; i += numPorPagina ){
                        if(i < numPorPagina){
                            htmlItensPaginacao = '<li class="active"><a href="javascript:;" class="pagination-num">' + indiceItensPaginacao + '</a></li>'; 
                        } else {
                            htmlItensPaginacao = '<li><a href="javascript:;" class="pagination-num">' + indiceItensPaginacao + '</a></li>';
                        }
                        $(elPaginacao).append(htmlItensPaginacao);
                        ultimoIndicePaginacao = indiceItensPaginacao;
                        indiceItensPaginacao++;                        
                    }
                    
                    htmlItensPaginacao = '<li><a href="javascript:;" class="pagination-proximo"><span aria-hidden="true">»</span></a></li>';
                    $(elPaginacao).append(htmlItensPaginacao);
                };
                $('body').delegate('.pagination-num', 'click', function (){
                    paginacaoAtual = parseInt($(this).text());
                    $(this).parent().siblings().removeClass('active');
                    $(this).parent().addClass('active');
                    inicioPaginacao = (paginacaoAtual * numPorPagina) - numPorPagina;
                    mostrarItens();
                });
                
                $('body').delegate('.pagination-anterior', 'click', function (){
                    
                    if(paginacaoAtual !== 0 && paginacaoAtual !== 1){
                        paginacaoAtual--;
                        $(this).parent().siblings().removeClass('active');
                        $(elPaginacao).children('li').eq(paginacaoAtual).addClass('active');
                    inicioPaginacao = (paginacaoAtual * numPorPagina) - numPorPagina;
                    mostrarItens();
                    }
                    
                });
                $('body').delegate('.pagination-proximo', 'click', function (){
                    debugger
                    if(paginacaoAtual !== ultimoIndicePaginacao){
                        
                        paginacaoAtual === 0 ? paginacaoAtual+=2 : paginacaoAtual++;
                        
                        $(this).parent().siblings().removeClass('active');
                        $(elPaginacao).children('li').eq(paginacaoAtual).addClass('active');
                        inicioPaginacao = (paginacaoAtual * numPorPagina) - numPorPagina;
                        mostrarItens();
                    }
                    
                });
                init();
            };
            paginacao();
             
        });
    </script>            
</body>
</html>