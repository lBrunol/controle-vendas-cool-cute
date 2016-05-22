<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Cadastro de Pedidos - Cool & Cute - Vendas</title>
    <%-- INCLUDE DO TOPO --%>
    <%@include file="/includes/topo.jsp" %>
    
</head>
<body>
    <%-- INCLUDE DO MENU --%>
    <%@include file="/includes/menu.jsp" %>
    <!-- CONTEÃDO -->
    <div class="container content">
        <ol class="breadcrumb">
            <li><a href="#">Início</a></li>
            <li><a href="#">Pedidos</a></li>
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
                    <form:errors path="pedido.*" />
                </div>
            </c:if>
        </c:if>
        <!-- MODAIS -->
        <!-- MODAL ANÚNCIO -->
        <div class="modal unique-selection fade" id="modal-anuncio" tabindex="-1" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">                        
                        <div class="col-md-8 col-sm-8">
                            <h4 class="modal-title">Selecione o Anúncio</h4>
                        </div>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <div class="col-md-4 col-sm-4">
                            <button type="button" class="btn btn-salvar pull-right data-modal" data-dismiss="modal" data-target="#input-anuncio">OK</button>
                        </div>                        
                    </div>
                    <div class="modal-body">
                        <div class="tabela-overflow tabela-modal">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Anúncio</th>
                                        <th>Código</th>
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
                        <button type="button" class="btn btn-salvar data-modal" data-dismiss="modal" data-target="#input-anuncio">OK</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal unique-selection fade" id="modal-cliente" tabindex="-1" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="col-md-8 col-sm-8">
                            <h4 class="modal-title">Selecione o Cliente</h4>
                        </div>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <div class="col-md-4 col-sm-4">
                            <button type="button" class="btn btn-salvar pull-right data-modal" data-dismiss="modal" data-target="#input-cliente">OK</button>
                        </div>
                    </div>
                    <div class="modal-body">
                        <div class="tabela-overflow tabela-modal">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>Cliente</th>
                                        <th>E-mail</th>
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
                        <button type="button" class="btn btn-salvar data-modal" data-dismiss="modal" data-target="#input-cliente">OK</button>
                    </div>
                </div>
            </div>
        </div>
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
                                        <th>Preço Venda</th>
                                        <th>Taxa</th>                                       
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-salvar" data-dismiss="modal">OK</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="modal-cancelar-pedido" tabindex="-1" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h2>Deseja realmente cancelar o pedido?</h2>
                    </div>
                    <div class="modal-body">
                        <p>Após o cancelamento, não será mais possível reativar este pedido</p>
                         <button type="button" class="btn btn-salvar margin-std-right margin-std-top" data-dismiss="modal"><i class="fa fa-fw fa-check"></i> Confirmar</button>
                         <button type="button" class="btn btn-vermelho margin-std-top" data-dismiss="modal"><i class="fa fa-fw fa-chevron-left"></i> Voltar</button>
                    </div>
                    <div class="modal-footer">
                        
                    </div>
                </div>
            </div>
        </div>
        <h2>Cadastrar Pedidos</h2>
        <hr />
        <form method="post" action="javascript:void(0);" id="formAnuncio">
            <div class="row">
                <div class="form-group col-md-6 col-xs-12">
                    <label for="txtAnuncio">Anúncio</label>
                    <div class="input-group">
                        <input type="text" id="input-anuncio" class="form-control" name="txtAnuncio" onkeypress="return(travaDigitacao(event))" onblur="return(validaTextoInvalido($(this)))" />
                        <div class="help-block with-errors"></div>
                        <span class="input-group-btn">
                            <button type="button" class="btn btn-mais" id="btn-modal-anuncio" data-toggle="modal" data-target="#modal-anuncio">+</button>
                        </span>
                    </div>                    
                </div>
                <div class="form-group col-md-6 col-xs-12">
                    <label for="txtCliente">Cliente</label>
                    <div class="input-group">
                        <input type="text" id="input-cliente" class="form-control" name="txtCliente" onkeypress="return(travaDigitacao(event))" onblur="return(validaTextoInvalido($(this)))" />
                        <div class="help-block with-errors"></div>
                        <span class="input-group-btn">
                            <button type="button" class="btn btn-mais" id="btn-modal-cliente" data-toggle="modal" data-target="#modal-cliente">+</button>
                        </span>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6 col-xs-12">
                    <label for="txtDataVenda">Data da Venda</label>
                    <input type="date" class="form-control" name="txtDataVenda" />
                </div>
                <div class="form-group col-md-6 col-xs-12">
                    <label for="txtValorFrete">Valor do Frete</label>
                    <input type="text" class="form-control" name="txtValorFrete" onkeypress="return(apenasNumeros(event))" onblur="atribuiTexto($(this),numeroParaMoeda($(this).val()))"/>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="pull-right">
                        <label class="padding-std-right">Itens do Pedido</label><button type="button" class="btn btn-mais btn-itens-pedido">+</button>
                    </div>
                    <div class="tabela-overflow">
                        <table class="table tabela-itens-pedido">
                            <thead>
                                <tr>
                                    <th>Código</th>
                                    <th>Nome</th>
                                    <th>Preço Compra</th>
                                    <th>Preço Venda</th>
                                    <th>Qtde.</th>
                                    <th>Taxa</th>
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="no-itens">
                                    <td colspan="6" class="btn-itens-pedido" style="color:#27a199; cursor:pointer;"><strong>Adicione itens ao pedido.</strong></td>
                                </tr>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="4"><strong>Valor Total: </strong></td>
                                    <td colspan="4" class="valor-total-pedido"></td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-4 col-xs-12">
                    <label for="txtDataPostagem">Data da Postagem</label>
                    <input type="date" class="form-control" name="txtDataPostagem" />
                </div>
                <div class="form-group col-md-4 col-xs-12">
                    <label for="txtEntrega">Data de Entrega</label>
                    <input type="date" class="form-control" name="txtDataEntrega" />
                </div>
                <div class="form-group col-md-4 col-xs-12">
                    <label for="txtCodigoPostagem">Código da Postagem</label>
                    <input type="text" class="form-control" name="txtCodigoPostagem" />
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6 col-xs-12">
                    <label for="slcStatus">Status</label>
                    <select class="form-control" name="slcStatus">
                        <c:forEach items="${statusPedido}" var="statusPedido">
                            <option value="${statusPedido.getCodigo()}">${statusPedido.getDescricao()}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group col-md-6 col-xs-12">
                    <label for="slcAvaliacao">Avaliação</label>
                    <select class="form-control">
                        <c:forEach items="${tipoAvaliacao}" var="tipoAvaliacao">
                            <option value="${tipoAvaliacao.getCodigo()}">${tipoAvaliacao.getDescricao()}</option>
                        </c:forEach>
                    </select>
                </div>                
            </div>
            <div class="row">
                <div class="form-group col-md-12">
                    <label for="txtObservacoes">Observações</label>
                    <textarea class="form-control" name="txtObservacoes"></textarea>
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
                    <button type="button" class="btn btn-warning margin-std-right margin-std-top" data-toggle="modal" data-target="#modal-cancelar-pedido"><i class="fa fa-fw fa-ban"></i> Cancelar Pedido</button>
                    <button type="button" class="btn btn-vermelho margin-std-top"><i class="fa fa-fw fa-chevron-left"></i> Voltar</button>
                    <button type="button" class="btn btn-vermelho margin-std-top btn-teste"><i class="fa fa-fw fa-chevron-left"></i> teste</button>
                    <a href="/pedido/teste" role="button" class="btn btn-vermelho margin-std-top btn-teste"><i class="fa fa-fw fa-chevron-left"></i> ir</a>
                    <input type="hidden" id="jsonValue" name="teste" />
                </div>
            </div>
        </form>        
    </div>
    <%-- INCLUDE DO RODAPÃ --%>
    <%@include file="/includes/rodape.jsp" %>
    <script type="text/javascript">
        $(function () {            
           
           var lstCodigosProdutos = new Array();

            $('#btn-modal-cliente').on('click', function (){
                $.ajax({
                    type: 'get',
                    headers: {
                        Accept: 'application/json; charset=utf-8',
                        'Content-Type': 'application/json; charset=utf-8'
                    },
                    url: '/servicoConsultarCliente',
                    beforeSend: function(){
                        showLoader('modal-cliente');
                    },
                    complete: function (){
                        hideLoader('modal-cliente');
                    },
                    success: function(data){
                        jsonToHtmlCliente(data);  
                    }
                });
            });
            
            $('#btn-modal-anuncio').on('click', function (){
                $.ajax({
                    type: 'get',
                    headers: {
                        Accept: 'application/json; charset=utf-8',
                        'Content-Type': 'application/json; charset=utf-8'
                    },
                    url: '/servicoConsultarAnuncio',
                    beforeSend: function(){
                        showLoader('modal-anuncio');
                    },
                    complete: function (){
                        hideLoader('modal-anuncio');
                    },
                    success: function(data){
                        jsonToHtmlAnuncio(data);  
                    }
                });
            });
            
            function jsonToHtmlAnuncio(data){
                
                var tr, td, tdText, parentEl;
                parentEl = document.getElementById('modal-anuncio').getElementsByTagName('tbody')[0];
              
                for (i = 0; i < data.length; i++){                    
                    tr = document.createElement('tr');                    
                    
                    td = document.createElement('td');
                    td.setAttribute('class', 'data-attr');
                    tdText = document.createTextNode(data[i].codigo);
                    td.appendChild(tdText);                    
                    tr.appendChild(td);
                    
                    td = document.createElement('td');
                    td.setAttribute('class', 'data-value');
                    tdText = document.createTextNode(data[i].descricao);
                    td.appendChild(tdText);                    
                    tr.appendChild(td);
                    
                    parentEl.appendChild(tr);
                }
                
            }
            
            function jsonToHtmlCliente(data){
                
                var tr, td, tdText, parentEl;
                parentEl = document.getElementById('modal-cliente').getElementsByTagName('tbody')[0];
              
                for (i = 0; i < data.length; i++){                    
                    tr = document.createElement('tr');                    
                    
                    td = document.createElement('td');
                    td.setAttribute('class', 'data-attr');
                    tdText = document.createTextNode(data[i].codigo);
                    td.appendChild(tdText);                    
                    tr.appendChild(td);
                    
                    td = document.createElement('td');
                    td.setAttribute('class', 'data-value');
                    tdText = document.createTextNode(data[i].nome);
                    td.appendChild(tdText);                    
                    tr.appendChild(td);
                    
                    td = document.createElement('td');
                    tdText = document.createTextNode(data[i].email);
                    td.appendChild(tdText);                    
                    tr.appendChild(td);
                    
                    parentEl.appendChild(tr);
                }
                
            }
            
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
                    tdText = document.createTextNode(data[i].precoCompra);
                    td.appendChild(tdText);
                    tr.appendChild(td);
                    
                    td = document.createElement('td');
                    tdText = document.createTextNode(data[i].precoVenda);
                    td.appendChild(tdText);
                    tr.appendChild(td);
                    
                    td = document.createElement('td');
                    tdText = document.createTextNode(data[i].taxa);
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
                    txtAnuncio: "required",
                    txtCliente: "required",
                    txtDataVenda: "required",
                    txtValorFrete: "required",
                    txtQtdePedido: "required",
                    txtDataPostagem: {
                        required: {
                            depends: function(element) {                                
                                if ($('select[name*="slcStatus"]').val() == 'À postar')
                                    return false;
                                else if ($('select[name*="slcStatus"]').val() == 'Cancelada')
                                    return false;
                                else
                                    return true;
                            }
                        }
                    },
                    txtDataEntrega: {
                        required: {
                            depends: function(element) {                                
                                if ($('select[name*="slcStatus"]').val() == 'À postar')
                                    return false;
                                else if ($('select[name*="slcStatus"]').val() == 'Cancelada')
                                    return false;
                                else if ($('select[name*="slcStatus"]').val() == 'Em trânsito')
                                    return false;
                                else
                                    return true;
                            }
                        }
                    },
                    txtCodigoPostagem: {
                        required: {
                            depends: function(element) {                                
                                if ($('select[name*="slcStatus"]').val() == 'À postar')
                                    return false;
                                else if ($('select[name*="slcStatus"]').val() == 'Cancelada')
                                    return false;
                                else
                                    return true;
                            }
                        }
                    }
                },
                messages: {
                    txtAnuncio: "Por favor, selecione o anúncio",
                    txtCliente: "Por favor, selecione o cliente",
                    txtDataVenda: "Por favor, preencha a data da venda",
                    txtValorFrete: "Por favor, preencha o valor do frete",
                    txtDataPostagem: "Por favor, preencha a data da postagem",
                    txtDataEntrega: "Por favor, preencha a data de entrega",
                    txtCodigoPostagem: "Por favor, preencha o código da postagem",
                    txtQtdePedido: "Por favor, preenche a quantidade"
                                    
                },
                submitHandler: function () {                    
                    validaItens ();
                }      
            });
            
            /* Valida se os itens do pedido estão preenchidos */           
            function validaItens (){
                if ($('.tabela-itens-pedido .no-itens').css('display') == 'table-row' || $('.tabela-itens-pedido tbody tr').length == 0){
                    $('.no-itens td').css('color', '#a94442');
                    
                    $('body').stop().animate({
                        scrollTop: $('.tabela-itens-pedido').scrollTop()
                    },
                    500,
                    function () {
                    
                    });                    
                    return true;
                } else {
                    $('.no-itens td').css('color', '#27a199');
                }
            }       

            /* Delega o evento blur (perder foco) ao adicionar itens do pedido */
            $('body').delegate('.input-qtde','blur', function () {
                var index = $('.input-qtde').index(this);
                var quantidade = $(this).val();
                var valor = deVirgulaParaPonto(retiraReal($('.tabela-itens-pedido .preco').eq(index).text()));
                var valorTotal = numeroParaMoeda(calculaValorTotal(quantidade, valor));

                $('.valor-total').eq(index).text(valorTotal);
                $('.valor-total-pedido').text(somaValoresTotais($('.tabela-itens-pedido')));
            });
            
            $('body').delegate('.input-qtde','live', function () {
                var valorTotal = numeroParaMoeda(calculaValorTotal(1, 200));
                $('.valor-total').eq(1).text(valorTotal);
            });
            
            /* Delega o evento click ao adicionar itens do pedido */
            $('body').delegate('.btn-excluir', 'click', function () {
                
                //Remove o código atual do array de controle dos produtos
                lstCodigosProdutos.splice(lstCodigosProdutos.indexOf(parseInt($(this).parent().siblings().eq(0).text()),0));

                //Remove a linha atual
                $(this).parent().parent().remove();                    
                
                //Caso a linha com valores de produtos seja a última, ele mostra a linha de adiciona itens
                if ($('.tabela-itens-pedido tbody tr').length <= 1) {
                    $('.tabela-itens-pedido .no-itens').show();
                }
                
                $('.valor-total-pedido').text(somaValoresTotais($('.tabela-itens-pedido')));
            });
                    
            $('body').delegate('.data-modal', 'click', function (){
                var dataTarget;
                var table;
                var origem;

                origem = $(this).closest('.modal').is('#modal-anuncio');
                console.log(origem);
                dataTarget = $(this).attr('data-target');

                table = $(this).closest('.modal').find('table');
                if($(table).find('tr').hasClass('active-tr')){
                    var activeTr;
                    var value;
                    var data;
                    
                    activeTr = $(table).find('.active-tr');
                    value = $(activeTr).find('.data-value').text();
                    data = $(activeTr).find('.data-attr').text();
                    
                    if($('#input-anuncio').attr('data-id') != data && origem ) {
                        $('.tabela-itens-pedido tr[data-index]').remove();
                        while(lstCodigosProdutos.length > 0) {
                            lstCodigosProdutos.pop();
                        }                
                        $('.tabela-itens-pedido .no-itens').show();
                    }
                    
                    $(dataTarget).attr('data-id', data).val(value);                    
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
                            $('.tabela-itens-pedido tbody').append('<tr data-index=' + this.rowIndex + '></tr>');
                            $('.tabela-itens-pedido tbody tr:last-child').append('<td>' + $(this).find('td').eq(0).text() + '</td><td>' + $(this).find('td').eq(1).text() +'</td><td>' + $(this).find('td').eq(2).text() + '</td><td class="preco">' + $(this).find('td').eq(3).text() + '</td><td><input type="number" class="form-control input-qtde" name="txtQtdePedido"></td>' + '</td><td>' + $(this).find('td').eq(4).text() + '<td class="valor-total">R$ 0,00</td><td><button class="btn btn-pequeno btn-vermelho btn-excluir" type="button"><i class="fa fa-trash fa-fw"></i></button></td>');
                            lstCodigosProdutos.push(parseInt($(this).find('td').eq(0).text()));
                            console.log(lstCodigosProdutos);
                        });

                        $('.tabela-itens-pedido').find('.no-itens').hide();
                    }
                }
            });

            /* Desmarca a classe active-tr ao sair do modal */
            $('.modal').on('hidden.bs.modal', function (e) {
                $(this).find('tr').removeClass('active-tr');
                $('.modal table tbody').find('tr').remove();
            });
            
            $('.btn-itens-pedido').on('click', function (e){
                if(typeof $('#input-anuncio').attr('data-id') == 'undefined' || $('#input-anuncio').attr('data-id') == ''){
                    alert('Por favor, selecione um anúncio antes de selecionar os itens do pedido.');
                } else {                    
                    $.ajax({
                        type: 'get',
                        headers: {
                            Accept: 'application/json; charset=utf-8',
                            'Content-Type': 'application/json; charset=utf-8'
                        },
                        url: '/servicoConsultaAnuncioProduto/' + $('#input-anuncio').attr('data-id'),
                        beforeSend: function(){
                            showLoader('modal-cliente');
                        },
                        complete: function (){
                            hideLoader('modal-cliente');
                        },
                        success: function(data){
                            jsonToHtmlItensAnuncioProduto(data);  
                        }
                    });
                    $('#modal-produto').modal();
                }
            });
        });
        
        $('.btn-teste').click(function (){
            var doUntil = $('.tabela-itens-pedido tbody tr').length;
            var lstItens = new Array();
            for ( i = 1; i < doUntil; i++ ){               
                var iten = new itensProduto(
                    parseInt($('.tabela-itens-pedido tbody tr').eq(i).find('td').eq(0).text()),
                    parseFloat($('.tabela-itens-pedido tbody tr').eq(i).find('td').eq(2).text()),
                    parseFloat($('.tabela-itens-pedido tbody tr').eq(i).find('td').eq(3).text()),
                    parseInt($('.tabela-itens-pedido tbody tr').eq(i).find('td').eq(4).find('input').val()),
                    parseFloat($('.tabela-itens-pedido tbody tr').eq(i).find('td').eq(5).text())
                );
                lstItens.push(iten);
                $('#jsonValue').val(iten);
            }
            
            console.log(lstItens);
            console.log(JSON.stringify(lstItens)); 
        });
        
        //Objeto para armazenar os valores do produto
        var itensProduto = function (id, valorCompra, valorVenda, quantidade, taxa){
          this.id = id;
          this.valorVenda = valorCompra;
          this.valorCompra = valorVenda;
          this.quantidade = quantidade;
          this.taxa = taxa;
        };
    </script>
</body>
</html>
