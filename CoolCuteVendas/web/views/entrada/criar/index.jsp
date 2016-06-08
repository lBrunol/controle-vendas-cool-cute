<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.joda.org/joda/time/tags" prefix="joda" %>
<!DOCTYPE html>
<html>
<head>
    <title>Cadastro de Entrada - Cool & Cute - Vendas</title>
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
            <li><a href="#">Entrada</a></li>
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
                    <form:errors path="entrada.*" />
                </div>
            </c:if>
        </c:if>
        <!-- MODAL DE PRODUTO -->        
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
                                        <th>Preço</th>                                 
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
        <h2>Cadastrar Entrada</h2>
        <hr />
        <form method="post" action="/adicionarAlterarEntrada" id="formAnuncio">            
            <div class="row">
                <div class="hidden">
                    <c:choose>
                        <c:when test="${not empty entrada.codigo}">
                          <input type="hidden" name="codigo" value="${entrada.codigo}" id="hdnCodigo" />
                        </c:when>
                        <c:otherwise>
                          <input type="hidden" name="codigo" value="0" id="hdnCodigo" />
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="form-group col-md-6 col-xs-12">
                    <label for="lote">Lote</label>
                    <input type="text" class="form-control" name="lote" value="${entrada.getLote()}" />                    
                </div>
            </div>            
            <div class="row">
                <div class="col-md-12">
                    <div class="pull-right">
                        <label class="padding-std-right">Itens do Entrada</label><button type="button" class="btn btn-mais btn-itens-entrada" id="btn-itens-entrada">+</button>
                    </div>
                    <div class="tabela-overflow">
                        <table class="table tabela-itens-entrada">
                            <thead>
                                <tr>
                                    <th>Código</th>
                                    <th>Nome</th>
                                    <th>Preço</th>
                                    <th>Qtde.</th>
                                    <th>Total</th>
                                    <th>Ações</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:if test="${itensEntrada == null}" >
                                    <tr class="no-itens">
                                        <td colspan="6" class="btn-itens-entrada" style="color:#27a199; cursor:pointer;"><strong>Adicione itens a está entrada.</strong></td>
                                    </tr> 
                                </c:if>
                                <c:if test="${itensEntrada != null}" >
                                    <tr class="no-itens" style="display: none;">
                                        <td colspan="6" class="btn-itens-entrada" style="color:#27a199; cursor:pointer;"><strong>Adicione itens a está entrada.</strong></td>
                                    </tr>
                                   
                                    <c:forEach items="${itensEntrada}" var="itensEntrada">
                                        <tr>
                                            <td>${itensEntrada.getCodigoProduto()}</td>
                                            <td>${itensEntrada.getNomeProduto()}</td>                                            
                                            <td class="preco"><fmt:formatNumber value="${itensEntrada.getValorProduto()}" type="currency" /></td>
                                            <td><input type="number" class="form-control input-qtde" value="${itensEntrada.getQuantidade()}"></td>
                                            <td class="valor-total"><fmt:formatNumber value="${itensEntrada.getValorTotal()}" type="currency" /></td>
                                            <td><button class="btn btn-pequeno btn-vermelho btn-excluir" type="button"><i class="fa fa-trash fa-fw"></i></button></td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="4"><strong>Valor Total:</strong></td>
                                    <td colspan="4" class="valor-total-entrada"><fmt:formatNumber value="${entrada.getValorTotal()}" type="currency" /></td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>            
            <div class="row">
                <div class="form-group col-md-12">
                    <label for="observacao">Observações</label>
                    <textarea class="form-control" name="observacao">${entrada.getObservacao()}</textarea>
                </div>
            </div>
            <div class="row margin-std-bottom">
                <div class="col-md-12">
                    <hr />
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <button type="submit" class="btn btn-salvar margin-std-right margin-std-top" id="btnSalvar"><i class="fa fa-fw fa-floppy-o"></i> Salvar</button>
                    <a role="button" href="/entrada/consultar/" class="btn btn-vermelho margin-std-top"><i class="fa fa-fw fa-chevron-left"></i> Voltar</a>                    
                </div>
            </div>
            <input type="hidden" value="${proximoId}" name="itensEntrada.codigoProduto" id="codigoProduto" />
            <input type="hidden" id="itens" name="itens" />
            <input type="hidden" id="hdnValorTotal" name="valorTotal" />
        </form>        
    </div>
    <%-- INCLUDE DO RODAPÉ --%>
    <%@include file="/includes/rodape.jsp" %>
    <script type="text/javascript">
        $(function () {            
           
           var lstCodigosProdutos = new Array();            
           
           //Adiciona os produtos no array 
            if($('#hdnCodigo').val() != "0"){
                $('.tabela-itens-entrada tbody tr:not(.no-itens) td:first-child').each(function(){
                    lstCodigosProdutos.push(parseInt($(this).text()));
                });
            }
            
            function EntradajsonToHtmlItensProduto(data){
                
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
                    lote: "required",
                    quantidade: "required"
                },
                messages: {
                    codigoPostagem: "Por favor, preencha o lote",
                    quantidade: "Por favor, preenche a quantidade"
                                    
                },
                submitHandler: function (form) {                      
                    acoesPosValidacao(form);
                }      
            });
            
            /* Delega o evento blur (perder foco) ao adicionar itens do entrada */
            $('body').delegate('.input-qtde','blur', function () {
                var index = $('.input-qtde').index(this);
                var quantidade = $(this).val();
                var valor = deRealParaFloat($('.tabela-itens-entrada .preco').eq(index).text());
                var valorTotal = numeroParaMoeda(calculaValorTotal(quantidade, valor));

                $('.valor-total').eq(index).text(valorTotal);
                $('.valor-total-entrada').text(somaValoresTotais($('.tabela-itens-entrada')));
            });
            
            $('body').delegate('.input-qtde','live', function () {
                var valorTotal = numeroParaMoeda(calculaValorTotal(1, 200));
                $('.valor-total').eq(1).text(valorTotal);
            });
            
            /* Delega o evento click ao adicionar itens do entrada */
            $('body').delegate('.btn-excluir', 'click', function () {
                
                //Remove o código atual do array de controle dos produtos
                lstCodigosProdutos.removeValue(parseInt($(this).parent().siblings().eq(0).text()));

                //Remove a linha atual
                $(this).parent().parent().remove();                    
                
                //Caso a linha com valores de produtos seja a última, ele mostra a linha de adiciona itens
                if ($('.tabela-itens-entrada tbody tr').length <= 1) {
                    $('.tabela-itens-entrada .no-itens').show();
                }
                
                $('.valor-total-entrada').text(somaValoresTotais($('.tabela-itens-entrada')));
            });
           
            /* Inclui os item(s) selecionados no modal para a tabela de itens do entrada */ 
            $('body').delegate('#modal-produto button', 'click', function (){
                if ($(this).closest('.modal').find('tr').hasClass('active-tr')) {
                    
                    var isAdicionado = false;
                    
                    for (i = 0; i < lstCodigosProdutos.length; i++){
                        if (lstCodigosProdutos[i] == parseInt($(this).closest('.modal').find('.active-tr').find('td').eq(0).text()))
                            isAdicionado = true;
                    }
                    
                    if (isAdicionado == false) { 
                        $(this).closest('.modal').find('.active-tr').each(function (index) {                            
                            $('.tabela-itens-entrada tbody').append('<tr data-index=' + this.rowIndex + '></tr>');
                            $('.tabela-itens-entrada tbody tr:last-child').append('<td>' + $(this).find('td').eq(0).text() + '</td><td>' + $(this).find('td').eq(1).text() +'</td><td class="preco">' + $(this).find('td').eq(2).text() + '</td><td><input type="number" class="form-control input-qtde" name="txtQtdeEntrada"></td>' + '<td class="valor-total">R$ 0,00</td><td><button class="btn btn-pequeno btn-vermelho btn-excluir" type="button"><i class="fa fa-trash fa-fw"></i></button></td>');
                            lstCodigosProdutos.push(parseInt($(this).find('td').eq(0).text()));
                        });

                        $('.tabela-itens-entrada').find('.no-itens').hide();
                    }
                }
            });

            /* Desmarca a classe active-tr ao sair do modal */
            $('.modal').on('hidden.bs.modal', function (e) {
                $(this).find('tr').removeClass('active-tr');
                $('.modal table tbody').find('tr').remove();
            });

            $('.btn-itens-entrada').on('click', function (e){
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
                        EntradajsonToHtmlItensProduto(data);  
                    }
                });
                $('#modal-produto').modal();
            });
        });
        
        /* Transforma os itens do entrada em Json e armazena em um input */
        function serializaItens(){
            var doUntil = $('.tabela-itens-entrada tbody tr').length;
            var lstItens = new Array();
            for ( i = 1; i < doUntil; i++ ){               
                var item = new itensProduto(
                    parseInt($('.tabela-itens-entrada tbody tr').eq(i).find('td').eq(0).text()),
                    parseInt($('#codigoProduto').val()),
                    parseInt($('.tabela-itens-entrada tbody tr').eq(i).find('td').eq(3).find('input').val()),
                    deRealParaFloat($('.tabela-itens-entrada tbody tr').eq(i).find('td').eq(4).text())                    
                );
                lstItens.push(item);
            }
            $('#itens').val(JSON.stringify(lstItens));
        }
        
        /* Executa a serialização dos itens do entrada, armazena os ids das combos em um input type hidden e valida se os itens do entrada estão preenchidos */           
        function acoesPosValidacao(form){
            
            serializaItens();
            $('#hdnCliente').val($('#input-cliente').attr('data-id'));
            $('#hdnAnuncio').val($('#input-anuncio').attr('data-id'));
            $('#hdnValorTotal').val(deVirgulaParaPonto(retiraReal($('.valor-total-entrada').text())));
            
            if ($('.tabela-itens-entrada .no-itens').css('display') == 'table-row' || $('.tabela-itens-entrada tbody tr').length == 0){
                $('.no-itens td').css('color', '#a94442');
                
                $('body').stop().animate({
                    scrollTop: $('.tabela-itens-entrada').scrollTop()
                },
                500,
                function () {
                
                });                            
                return false;
            } else {
                $('.no-itens td').css('color', '#27a199');
                form.submit();
            }
        } 
        
        //Objeto para armazenar os valores do produto
        var itensProduto = function (codigoProduto, codigoEntrada, quantidade, valorTotal ){
          this.codigoProduto = codigoProduto;
          this.codigoEntrada = codigoEntrada;
          this.quantidade = quantidade;
          this.valorTotal = valorTotal;          
        };
    </script>
</body>
</html>
