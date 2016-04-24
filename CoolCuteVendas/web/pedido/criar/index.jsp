<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Anúncio</th>
                                    <th>Código</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="data-value">Mochila Azul</td>
                                    <td class="data-attr">1</td>                        
                                </tr>
                                <tr>
                                    <td class="data-value">Mochila Rosa</td>
                                    <td class="data-attr">2</td>
                                </tr>
                                <tr>
                                    <td class="data-value">Bolsa Tommy</td>
                                    <td class="data-attr">3</td>
                                </tr>
                            </tbody>
                        </table>
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
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Cliente</th>
                                    <th>E-mail</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="data-attr">1</td>                                    
                                    <td class="data-value">Carlos da Silva</td>
                                    <td>carlos-silva@hotmail.com</td>
                                </tr>
                                <tr>
                                    <td class="data-attr">2</td>                                    
                                    <td class="data-value">Andrea de souza lemos ramos da costa</td>
                                    <td>deia-lemos@gmail.com</td>
                                </tr>
                                <tr>
                                    <td class="data-attr">3</td>                                    
                                    <td class="data-value">Carlos da Silva</td>
                                    <td>carlos-silva@hotmail.com</td>
                                </tr>
                                <tr>
                                    <td class="data-attr">4</td>                                    
                                    <td class="data-value">Andrea de souza lemos ramos da costa</td>
                                    <td>deia-lemos@gmail.com</td>
                                </tr>                                
                            </tbody>
                        </table>
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
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Anúncio</th>
                                    <th>Preço</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Mochila Azul</td>
                                    <td>R$ 70,00</td>
                                </tr>
                                <tr>
                                    <td>Mochila Rosa</td>
                                    <td>R$ 70,00</td>
                                </tr>
                                <tr>
                                    <td>Bolsa Tommy</td>
                                    <td>R$ 120,00</td>
                                </tr>
                            </tbody>
                        </table>
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
                            <button type="button" class="btn btn-mais" data-toggle="modal" data-target="#modal-anuncio">+</button>
                        </span>
                    </div>                    
                </div>
                <div class="form-group col-md-6 col-xs-12">
                    <label for="txtCliente">Cliente</label>
                    <div class="input-group">
                        <input type="text" id="input-cliente" class="form-control" name="txtCliente" onkeypress="return(travaDigitacao(event))" onblur="return(validaTextoInvalido($(this)))" />
                        <div class="help-block with-errors"></div>
                        <span class="input-group-btn">
                            <button type="button" class="btn btn-mais" data-toggle="modal" data-target="#modal-cliente">+</button>
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
                        <label class="padding-std-right">Itens do Pedido</label><button type="button" class="btn btn-mais" data-toggle="modal" data-target="#modal-produto">+</button>
                    </div>
                    <div class="tabela-overflow">
                        <table class="table tabela-itens-pedido">
                            <thead>
                                <tr>
                                    <th>Item</th>
                                    <th>Preço</th>
                                    <th>Qtde.</th>
                                    <th>Total</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="no-itens">
                                    <td colspan="6" data-toggle="modal" data-target="#modal-produto" style="color:#27a199; cursor:pointer;"><strong>Adicione itens ao pedido.</strong></td>
                                </tr>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="3"><strong>Valor Total: </strong></td>
                                    <td colspan="3" class="valor-total-pedido"></td>
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
                        <option>À postar</option>
                        <option>Em trânsito</option>
                        <option>Entregue</option>
                        <option>Concretizada</option>
                        <option>Retirada</option>
                        <option>Devolução</option>
                        <option>Reclamação</option>
                        <option>Defeito</option>
                        <option>Cancelada</option>
                        <option>Qualificada</option>
                        <option>Extravio</option>
                    </select>
                </div>
                <div class="form-group col-md-6 col-xs-12">
                    <label for="slcAvaliacao">Avaliação</label>
                    <select class="form-control">
                        <option>Positiva</option>
                        <option>Negativa</option>
                        <option>Neutra</option>
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
                </div>
            </div>
        </form>        
    </div>
    <%-- INCLUDE DO RODAPÃ --%>
    <%@include file="/includes/rodape.jsp" %>
    <script type="text/javascript">
        $(function () {   
            
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
