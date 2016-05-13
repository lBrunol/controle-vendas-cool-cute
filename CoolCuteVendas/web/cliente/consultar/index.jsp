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
        <!--BreadCrumbs-->
        <ol class="breadcrumb">
            <li><a href="#">Início</a></li>
            <li><a href="#">Clientes</a></li>
            <li class="active">Consultar</li>
        </ol>
         <!-- FIM BreadCrumbs-->

        <h2>Consultar Clientes</h2>
        <hr>
        <h3>Selecione o Filtro:</h3>
        <form method="post" action="javascript:void(0);" id="form-consultar-clientes">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-filtro">
                        <div class="panel-body">                                
                            <div class="col-md-6 col-xs-12">
                                <label class="control-label radio-check label-checkbox">
                                    <input type="radio" value="nome" name="rdbFiltro" id="rdbNome" />
                                    Nome
                                </label>
                            </div>
                            <div class="col-md-6 col-xs-12">
                                <label class="control-label radio-check label-checkbox">
                                    <input type="radio" value="email" name="rdbFiltro" id="rdbEmail" />
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
                                    <th>Nome</th>
                                    <th>Email</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                
                                    <tr>
                                       <td>Thiago Pereira </td>
                                         <td>thiago.beatriz.pereira@gmail.com </td>
                                        <td> 
                                            <a class="btn btn-pequeno btn-warning" role="button"><i class="fa fa-fw fa-pencil-square-o"></i> Editar</a>
                                            <button type="button" class="btn btn-pequeno btn-vermelho btn-excluir" data-target=".modal-excluir" data-toggle="modal"><i class="fa fa-trash fa-fw"></i> Excluir</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td> Bruno Alves</td>
                                         <td>bruno.alves@gmail.com </td>

                                        <td> 
                                            <a class="btn btn-pequeno btn-warning" role="button"><i class="fa fa-fw fa-pencil-square-o"></i> Editar</a>
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
    </div>
    <%-- INCLUDE DO RODAPÉ --%>
    <%@include file="/includes/rodape.jsp" %>
    <script>
        $('.btn-excluir').click(function(){
           var id = $(this).closest('tr').find('td[data-id]').attr('data-id');
           var descricao = $(this).closest('tr').find('td[data-descricao]').attr('data-descricao');
           console.log(id + " " + descricao);
           $('.modal-excluir .modal-id span').html(id);
           $('.modal-excluir .modal-descricao span').html(descricao);
        });
    </script>
</body>
</html>