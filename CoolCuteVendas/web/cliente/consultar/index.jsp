<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                        <p><strong>Id: </strong>1</p>
                        <p><strong>Nome: </strong>Carlos de Souza Silva</p>
                        <button type="button" class="btn btn-salvar margin-std-right margin-std-top" data-dismiss="modal"><i class="fa fa-fw fa-check"></i> Confirmar</button>
                        <button type="button" class="btn btn-vermelho margin-std-top" data-dismiss="modal"><i class="fa fa-fw fa-chevron-left"></i> Voltar</button>
                    </div>
                    <div class="modal-footer">

                    </div>
                </div>
            </div>
        </div>      

        <!--BreadCrumbs-->
        <ol class="breadcrumb">
            <li><a href="#">Início</a></li>
            <li><a href="#">Clientes</a></li>
            <li class="active">Consultar</li>
        </ol>
        <h2>Consultar Cliente</h2>
        <hr />
        <h3>Selecione o Filtro:</h3>
        <form method="post" action="javascript:void(0);" id="form-consultar-clientes">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-filtro">
                        <div class="panel-body">                                
                            <div class="col-md-6 col-xs-12">
                               
                                <label class="control-label radio-check label-checkbox">
                                    <input type="radio" value="nome" class="radioFiltro" name="rdbFiltro[]" id="rdbNome" />
                                    Nome
                                </label>
                            </div>
                            <div class="col-md-6 col-xs-12">
                                <label class="control-label radio-check label-checkbox">
                                    <input type="radio" value="email" class="radioFiltro" name="rdbFiltro[]" id="rdbEmail" />
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
                        <input type="text" class="form-control" placeholder="Filtro por: Nome" aria-describedby="basic-addon2" id="txtPesquisa" />
                        <span class="input-group-btn"><button type="button" id="btnPesquisar" class="btn btn-salvar"><i class="fa fa-fw fa-search"></i></button></span>
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
                                <tr>
                                    <td class="codigo-consulta">1</td>
                                    <td>Carlos de Souza Silva</td>
                                    <td>carlos-souza@gmail.com</td>
                                    <td>
                                        <button class="btn btn-pequeno btn-warning" type="button"><i class="fa fa-fw fa-pencil-square-o"></i> Editar</button>
                                        <button type="button" class="btn btn-pequeno btn-vermelho btn-excluir" data-target=".modal-excluir" data-toggle="modal"><i class="fa fa-trash fa-fw"></i> Excluir</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="codigo-consulta">2</td>
                                    <td>Jaine da Costa</td>
                                    <td>costa.jaine@bol.com.br</td>
                                    <td>
                                        <button class="btn btn-pequeno btn-warning" type="button"><i class="fa fa-fw fa-pencil-square-o"></i> Editar</button>
                                        <button type="button" class="btn btn-pequeno btn-vermelho btn-excluir" data-target=".modal-excluir" data-toggle="modal"><i class="fa fa-trash fa-fw"></i> Excluir</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="codigo-consulta">3</td>
                                    <td>Miriam Autino Cruz</td>
                                    <td>mautino-cruz@bol.com.br</td>
                                    <td>
                                        <button class="btn btn-pequeno btn-warning" type="button"><i class="fa fa-fw fa-pencil-square-o"></i> Editar</button>
                                        <button type="button" class="btn btn-pequeno btn-vermelho btn-excluir" data-target=".modal-excluir" data-toggle="modal"><i class="fa fa-trash fa-fw"></i> Excluir</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="codigo-consulta">4</td>
                                    <td>Camila Soares de Souza</td>
                                    <td>mila.soares@hotmail.com</td>
                                    <td>
                                        <button class="btn btn-pequeno btn-warning" type="button"><i class="fa fa-fw fa-pencil-square-o"></i> Editar</button>
                                        <button type="button" class="btn btn-pequeno btn-vermelho btn-excluir" data-target=".modal-excluir" data-toggle="modal"><i class="fa fa-trash fa-fw"></i> Excluir</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="codigo-consulta">5</td>
                                    <td>José Santos da Penha</td>
                                    <td>jose-penha@gmail.com</td>
                                    <td>
                                        <button class="btn btn-pequeno btn-warning" type="button"><i class="fa fa-fw fa-pencil-square-o"></i> Editar</button>
                                        <button type="button" class="btn btn-pequeno btn-vermelho btn-excluir" data-target=".modal-excluir" data-toggle="modal"><i class="fa fa-trash fa-fw"></i> Excluir</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="codigo-consulta">6</td>
                                    <td>Magda Cipriano</td>
                                    <td>cip-magda@bol.com.br</td>
                                    <td>
                                        <button class="btn btn-pequeno btn-warning" type="button"><i class="fa fa-fw fa-pencil-square-o"></i> Editar</button>
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
    
    
    <!-- <!-- _____________javaScript___________________ -->
    
    <script type="text/javascript">
        $(function () {   
            
            /* Validação dos campos do formulário */
            $("#formConsultarClientes").validate({
                errorPlacement: function(error, element) {
                $( element )
                    .closest( "form" )
                        .find( "label[for='" + element.attr( "name" ) + "']" )
                            .append( error );                
                },
                errorElement: "span",
                rules: {
                    
                    depends: function(element) {                                
                                if ($().val() == 'À postar')
                                    return false;
                                else if ($('select[name*="slcStatus"]').val() == 'Cancelada')
                                    return false;
                                else
                                    return true;
                            }
                }
                    rdbNome: "required",
                    txtEmailCliente: "required"
                   
                              },
                   
                  
 
                messages: {
                    txtNomeCliente: "Por favor, insira um nome válido",
                    txtEmailCliente: "Por favor, insira um email válido"
                  
                                    
                }
                

     </script>              
            
</body>
</html>