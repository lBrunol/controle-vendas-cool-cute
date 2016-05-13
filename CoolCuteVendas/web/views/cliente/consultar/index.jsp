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
        <c:if test="${msg != null }">
            <div class="alert alert-danger alert-dismissible fade in" role="alert"> 
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button> 
                <i class="fa fa-fw fa-times"></i> ${msg}
            </div>
        </c:if> 
        <h2>Consultar Cliente</h2>
        <hr />
        <h3>Selecione o Filtro:</h3>
        <form method="post" action="/filtraCliente" id="form-consultar-clientes">
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
                        <input type="text" class="form-control" placeholder="Filtro por: Nome" name="nome" aria-describedby="basic-addon2" id="txtPesquisa" />
                        <span class="input-group-btn"><button type="submit" href="/filtraCliente" id="btnPesquisar" class="btn btn-salvar"><i class="fa fa-fw fa-search"></i></button></span>
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
                                            <a href="/consultarTipoAnuncioItem/${cliente.codigo}" class="btn btn-pequeno btn-warning" role="button"><i class="fa fa-fw fa-pencil-square-o"></i> Editar</a>
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
                    nome: "required",
                    email: "required"
                   
                }, 
                messages: {
                    nome: "Por favor, insira um nome válido",
                    email: "Por favor, insira um email válido"                                    
                }
            });
            
            $('input[type="radio"]').on('change', function() {
                $('#txtPesquisa').attr('name',$('input[type="radio"]:checked').val());
             });
        });
    </script>            
</body>
</html>