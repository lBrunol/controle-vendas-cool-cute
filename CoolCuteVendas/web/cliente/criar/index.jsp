<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Cadastro de Clientes - Cool & Cute - Vendas</title>
    <%-- INCLUDE DO TOPO --%>
    <%@include file="/includes/topo.jsp" %>
</head>
<body>
    <%-- INCLUDE DO MENU --%>
    <%@include file="/includes/menu.jsp" %>
    <!-- CONTEÚDO -->
    <div class="container content">
        <!--BreadCrumbs-->
        <ol class="breadcrumb">
            <li><a href="#">Início</a></li>
            <li><a href="#">Clientes</a></li>
            <li class="active">Criar/Editar</li>
        </ol>
        <!--Fim BreadCrumbs-->                 
        <h2>Cadastrar Clientes</h2>
        <hr />
        <form method="post" action="javascript:void(0);" id="formClientes">
            <div class="row">
                <div class="form-group col-md-6 col-xs-12">
                    <label for="txtNomeCliente">Nome do Cliente</label>
                    <input type="text" id="input-cliente" class="form-control" name="txtNomeCliente" />
                </div> 

                <div class="form-group col-md-6 col-xs-12">
                    <label for="txtEmailCliente">Email</label>
                    <input type="text" id="input-email"class="form-control" name="txtEmailCliente" />
                </div> 

            </div>           
            <div class="row">
                <div class="col-md-12">
                    <button type="submit" class="btn btn-salvar margin-std-right margin-std-top"><i class="fa fa-fw fa-floppy-o"></i> Salvar</button>                
                    <button type="button" class="btn btn-vermelho margin-std-top"><i class="fa fa-fw fa-chevron-left"></i> Voltar</button>
                </div>
            </div>
        </form>
   </div>
    
    <%-- INCLUDE DO RODAPÉ --%>
    <%@include file="/includes/rodape.jsp" %> 
    
   <!-- _____________javaScript___________________ -->
    
    <script type="text/javascript">
        $(function () {   
            
            /* Validação dos campos do formulário */
            $("#formClientes").validate({
                errorPlacement: function(error, element) {
                $( element )
                    .closest( "form" )
                        .find( "label[for='" + element.attr( "name" ) + "']" )
                            .append( error );                
                },
                errorElement: "span",
                rules: {
                    txtNomeCliente: "required",
                    txtEmailCliente: "required"
                   
                              },
                   
                  
 
                messages: {
                    txtNomeCliente: "Por favor, insira um nome válido",
                    txtEmailCliente: "Por favor, insira um email válido"
                  
                                    
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
                var dataIndex;

                dataIndex = $(this).parent().parent().attr('data-index');
                $(this).parent().parent().remove();

                $('#modal-produto tr').eq(dataIndex).find('td').eq(0).removeClass('selecionada');
                
                if ($('.tabela-itens-pedido tbody tr').length <= 1) {
                    $('.tabela-itens-pedido .no-itens').show();
                }
                $('.valor-total-pedido').text(somaValoresTotais($('.tabela-itens-pedido')));
            });
            
            /* Delega o evento blur (perder foco) ao adicionar itens do pedido */
            $('.data-modal').click(function (){
                var dataTarget;
                var table;

                dataTarget = $(this).attr('data-target');
                
                table = $(this).closest('.modal').find('table');
                if($(table).find('tr').hasClass('active-tr')){
                    var activeTr;
                    var value;
                    var data;
                    
                    activeTr = $(table).find('.active-tr');
                    value = $(activeTr).find('.data-value').text();
                    data = $(activeTr).find('.data-attr').text();
                    
                    $(dataTarget).attr('data-id', data).val(value);                    
                }                   
            });
            
            /* Inclui os item(s) selecionados no modal para a tabela de itens do pedido */ 
            $('#modal-produto button').click(function (){
                if ($(this).closest('.modal').find('tr').hasClass('active-tr')) {
                    if ($('.modal .active-tr td:eq(0)').hasClass('selecionada') == false) { 
                    $(this).closest('.modal').find('.active-tr').each(function (index) {                            
                        $('.tabela-itens-pedido tbody').append('<tr data-index=' + this.rowIndex + '></tr>');
                        $('.tabela-itens-pedido tbody tr:last-child').append('<td>' + $(this).find('td').eq(0).text() + '</td><td class="preco">' + $(this).find('td').eq(1).text() + '</td><td><input type="number" class="form-control input-qtde" name="txtQtdePedido"></td><td class="valor-total">R$ 0,00</td><td><button class="btn btn-pequeno btn-vermelho btn-excluir" type="button"><i class="fa fa-trash fa-fw"></i></button></td>');
                        $(this).find('td').eq(0).addClass('selecionada');
                    });

                    $('.tabela-itens-pedido').find('.no-itens').hide();
                    }
                }               
            });
            
            /* Desmarca a classe active-tr ao sair do modal */
            $('.modal').on('hidden.bs.modal', function (e) {
                $(this).find('tr').removeClass('active-tr');
            });            
        });
    </script>
    
    
    
    
       
</body>
</html>