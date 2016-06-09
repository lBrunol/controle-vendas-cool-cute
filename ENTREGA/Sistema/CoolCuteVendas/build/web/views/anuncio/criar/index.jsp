<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Cadastro de Anúncio - Cool & Cute - Vendas</title>
    <%-- INCLUDE DO TOPO --%>
    <%@include file="/includes/topo.jsp" %>
</head>
<body>
    <%-- INCLUDE DO MENU --%>
    <%@include file="/includes/menu.jsp" %>
    <!-- CONTEÚDO -->
    <div class="container content">
        <ol class="breadcrumb">
            <li><a href="#">Início</a></li>
            <li><a href="#">Anúncio</a></li>
            <li class="active">Criar/Editar</li>
        </ol>
        <c:if test="${retorno != null }">
            <c:if test="${retorno == true }">
                <div class="alert alert-success alert-dismissible fade in" role="alert"> 
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button> 
                    <i class="fa fa-fw fa-check"></i> ${msg}
                </div>
            </c:if>
            <c:if test="${retorno == false }">
                <div class="alert alert-danger alert-dismissible fade in" role="alert"> 
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button> 
                    <i class="fa fa-fw fa-times"></i> ${msg}
                    <form:errors path="anuncio.*" />
                </div>
            </c:if>
        </c:if>
        <!-- MODAIS -->
        <!-- MODAL PRODUTOS -->
        <div class="modal multi-selection fade" id="modal-produto" tabindex="-1" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">

                        <div class="col-md-8 col-sm-8">
                            <h4 class="modal-title">Selecione os Produtos</h4>
                        </div>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <div class="col-md-4 col-sm-4">

                            <button type="button" class="btn btn-salvar pull-right" data-dismiss="modal">OK</button>
                        </div>

                    </div>
                    <div class="modal-body">
                        <div class="tabela-overflow tabela-modal">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Código</th>
                                        <th>Nome</th>
                                        <th>Preço Compra</th>                                      
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                </tbody>
                            </table>
                        </div>
                        <div class="loader-ajax">
                            <img src="/imagens/loader.gif" />
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-salvar" data-dismiss="modal">OK</button>
                    </div>
                </div>
            </div>
        </div>
        <h2>Cadastro de Anúncio</h2>
        <hr>
        <form method="post" action="/adicionarAlterarAnuncio" id="formAnuncio">
            <div class="row">
                <div class="hidden">
                    <c:choose>
                        <c:when test="${not empty anuncio.codigo}">
                          <input type="hidden" name="codigo" value="${anuncio.codigo}" id="hdnCodigo" />
                        </c:when>
                        <c:otherwise>
                          <input type="hidden" name="codigo" value="0" id="hdnCodigo" />
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="form-group col-md-6">
                    <label for="descricao">Descrição</label>
                    <input type="text" class="form-control" name="descricao"  value="${anuncio.getDescricao()}"/>
                </div>
                <div class="form-group col-md-6 col-xs-12">
                    <label for="preco">Preço</label>
                    <input type="text" class="form-control" name="preco" value="<fmt:formatNumber type="currency" value="${anuncio.getPreco()}" />" onkeypress="return(apenasNumeros(event))" onblur="atribuiTexto($(this),numeroParaMoeda($(this).val()))" />
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6 col-xs-12">
                    <label for="statusAnuncio.codigo">Status</label>
                    <select class="form-control" name="statusAnuncio.codigo" id="statusAnuncio">
                        <c:forEach items="${statusAnuncio}" var="statusAnuncio">
                            <option value="${statusAnuncio.getCodigo()}">${statusAnuncio.getDescricao()}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group col-md-6 col-xs-12">
                    <label for="tipoAnuncio.codigo">Tipo</label>
                    <select class="form-control" name="tipoAnuncio.codigo" id="tipoAnuncio">
                        <c:forEach items="${tipoAnuncio}" var="tipoAnuncio">
                            <option value="${tipoAnuncio.getCodigo()}">${tipoAnuncio.getDescricao()}</option>
                        </c:forEach>
                    </select>
                </div>                
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="pull-right">
                        <label class="padding-std-right">Produtos deste anúncio</label><button type="button" class="btn btn-mais btn-produto-anuncio" data-toggle="modal" data-target="#modal-produto">+</button>
                    </div>
                    <div class="tabela-overflow">
                        <table class="table tabela-itens-produto">
                            <thead>
                                <tr>
                                    <th>Código</th>
                                    <th>Nome</th>
                                    <th>Preço Compra</th>
                                    <th>Ações</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:if test="${produtoAnuncio == null}" >
                                    <tr class="no-itens">
                                        <td colspan="4" class="btn-produto-anuncio" data-toggle="modal" data-target="#modal-produto" style="color:#27a199; cursor:pointer;"><strong>Adicione produtos a este anúncio.</strong></td>
                                    </tr> 
                                </c:if>
                                <c:if test="${produtoAnuncio != null}" >
                                    <tr class="no-itens" style="display: none;">
                                        <td colspan="4" class="btn-produto-anuncio" data-toggle="modal" data-target="#modal-produto" style="color:#27a199; cursor:pointer;"><strong>Adicione produtos a este anúncio.</strong></td>
                                    </tr>
                                    <c:forEach items="${produtoAnuncio}" var="produtoAnuncio">
                                        <tr>
                                            <td>${produtoAnuncio.getCodigoProduto()}</td>
                                            <td>${produtoAnuncio.getNome()}</td>
                                            <td class="preco"><fmt:formatNumber type="currency" value="${produtoAnuncio.getPrecoCompra()}" /></td>
                                            <td><button class="btn btn-pequeno btn-vermelho btn-excluir" type="button"><i class="fa fa-trash fa-fw"></i></button></td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                            </tbody>                            
                        </table>
                    </div>
                </div>
            </div>
            <div class="row margin-std-bottom">
                <div class="col-md-12">
                    <hr />
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <button type="submit" class="btn btn-salvar margin-std-right margin-std-top"><i class="fa fa-fw fa-floppy-o"></i> Salvar</button>
                    <a role="button" href="/anuncio/consultar/" class="btn btn-vermelho margin-std-top"><i class="fa fa-fw fa-chevron-left"></i> Voltar</a>
                </div>
            </div>
            <input type="hidden" value="${proximoId}" name="produtoAnuncio.codigo" id="codigoAnuncio" />
            <input type="hidden" id="itensAnuncio" name="itensAnuncio" />
        </form>
    </div>    
    <%-- INCLUDE DO RODAPÉ --%>
    <%@include file="/includes/rodape.jsp" %>
    <script type="text/javascript">
        $(function () {           
            
            var lstCodigosProdutos = new Array();
            
            //Adiciona os produtos do anúncio no array 
            if($('#hdnCodigo').val() != "0"){
                $('.tabela-itens-produto tbody tr:not(.no-itens) td:first-child').each(function(){
                    lstCodigosProdutos.push(parseInt($(this).text()));
                });
            }
            
            $('.btn-produto-anuncio').on('click', function (){
                $.ajax({
                    type: 'get',
                    headers: {
                        Accept: 'application/json; charset=utf-8',
                        'Content-Type': 'application/json; charset=utf-8'
                    },
                    url: '/servicoConsultarProduto/',
                    beforeSend: function(){
                        showLoader('modal-produto');
                    },
                    complete: function (){
                        hideLoader('modal-produto');
                    },
                    success: function(data){
                        jsonToHtmlItensAnuncioProduto(data);
                    }
                });
            });
            
            function jsonToHtmlItensAnuncioProduto(data){
                
                var tr, td, tdText, parentEl;
                parentEl = document.getElementById('modal-produto').getElementsByTagName('tbody')[0];
              
                for (i = 0; i < data.length; i++){                    
                    tr = document.createElement('tr');                    
                    
                    td = document.createElement('td');
                    tdText = document.createTextNode(data[i].codigo);
                    td.appendChild(tdText);
                    tr.appendChild(td);
                    
                    td = document.createElement('td');
                    tdText = document.createTextNode(data[i].nome);
                    td.appendChild(tdText);
                    tr.appendChild(td);
                    
                    td = document.createElement('td');
                    tdText = document.createTextNode(numeroParaMoeda(data[i].preco));
                    td.appendChild(tdText);
                    tr.appendChild(td);                    
                    
                    parentEl.appendChild(tr);
                }
                
            }
            
            /* Validação dos campos do formulário */
            $("#formAnuncio").validate({
                errorPlacement: function(error, element) {
                $( element )
                    .closest( "form" )
                        .find( "label[for='" + element.attr( "name" ) + "']" )
                            .append( error );                
                },
                errorElement: "span",
                rules: {
                    descricao: "required",
                    preco: "required"
                },
                messages: {
                    descricao: "Por favor, preencha a descrição",
                    preco: "Por favor, preencha o preço"
                },
                submitHandler: function (form) {                      
                    acoesPosValidacao(form);
                } 
            });
            
            /* Delega o evento click ao adicionar itens do pedido */
            $('body').delegate('.btn-excluir', 'click', function () {
                
                //Remove o código atual do array de controle dos produtos
                lstCodigosProdutos.removeValue(parseInt($(this).parent().siblings().eq(0).text()));
                //Remove a linha atual
                $(this).parent().parent().remove();                    
                
                //Caso a linha com valores de produtos seja a última, ele mostra a linha de adiciona itens
                if ($('.tabela-itens-produto tbody tr').length <= 1) {
                    $('.tabela-itens-produto .no-itens').show();
                }
                
            });
            
            /* Inclui os item(s) selecionados no modal para a tabela de itens do pedido */ 
            $('body').delegate('#modal-produto button', 'click', function (){
                if ($(this).closest('.modal').find('tr').hasClass('active-tr')) {
                    
                    var isAdicionado = false;
                    
                    for (i = 0; i < lstCodigosProdutos.length; i++){
                        if (lstCodigosProdutos[i] == parseInt($(this).closest('.modal').find('.active-tr').find('td').eq(0).text()))
                            isAdicionado = true;
                    }
                    
                    if (isAdicionado == false) { 
                        $(this).closest('.modal').find('.active-tr').each(function (index) {                            
                            $('.tabela-itens-produto tbody').append('<tr data-index=' + this.rowIndex + '></tr>');
                            $('.tabela-itens-produto tbody tr:last-child').append('<td>' + $(this).find('td').eq(0).text() + '</td><td>' + $(this).find('td').eq(1).text() +'</td><td td class="preco">' + $(this).find('td').eq(2).text() + '<td><button class="btn btn-pequeno btn-vermelho btn-excluir" type="button"><i class="fa fa-trash fa-fw"></i></button></td>');
                            lstCodigosProdutos.push(parseInt($(this).find('td').eq(0).text()));
                        });

                        $('.tabela-itens-produto').find('.no-itens').hide();
                    }
                }
            });
            
            /* Desmarca a classe active-tr ao sair do modal */
            $('.modal').on('hidden.bs.modal', function (e) {
                $(this).find('tr').removeClass('active-tr');
                $('.modal table tbody').find('tr').remove();
            });            
        });
        
        /* Transforma os itens do pedido em Json e armazena em um input */
        function acoesPosValidacao(form){
            var doUntil = $('.tabela-itens-produto tbody tr').length;
            var lstItens = new Array();
            for ( i = 1; i < doUntil; i++ ){               
                var item = new itensProduto(
                    parseInt($('#codigoAnuncio').val()),
                    parseInt($('.tabela-itens-produto tbody tr').eq(i).find('td').eq(0).text())
                );
                lstItens.push(item);                
            }
            $('#itensAnuncio').val(JSON.stringify(lstItens));
            form.submit();
        }

        //Objeto para armazenar os valores do produto
        var itensProduto = function (codigo, codigoProduto){
            this.codigo = codigo;
            this.codigoProduto = codigoProduto;
        };
        
        <c:if test="${anuncio.statusAnuncio.codigo != null }">
            selectValorDropdownList(${anuncio.statusAnuncio.codigo}, 'statusAnuncio');            
        </c:if>
            
        <c:if test="${anuncio.tipoAnuncio.codigo != null }">            
            selectValorDropdownList(${anuncio.tipoAnuncio.codigo}, 'tipoAnuncio');            
        </c:if>
            
        
    </script>    
</body>
</html>