<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Consulta de Entradas - Cool & Cute - Vendas</title>
    <%-- INCLUDE DO TOPO --%>
    <%@include file="/includes/topo.jsp" %>
</head>
<body>
    <%-- INCLUDE DO MENU --%>
    <%@include file="/includes/menu.jsp" %>
    <!-- CONTEÚDO -->
    <div class="container content">
        <h2>Consultar Entradas</h2>
        <hr />
        <div class="row">
            <div class="col-md-12 text-right">
                <a role="button" href="/entrada/criar/" class="btn btn-mais">Adicionar Entrada +</a>
            </div>
        </div>
        <form method="GET" action="/filtrarCliente" id="form-consultar-entrada">
            <div class="row">
                <div class="col-md-2 col-sm-12 form-group">
                    <label for="codigo">Código</label>
                    <input type="text" class="form-control" placeholder="Código" name="codigo" aria-describedby="basic-addon2" id="txtPesquisa" />
                </div>
                <div class="col-md-5 col-sm-12 form-group">
                    <label for="lote">Lote</label>
                    <input type="text" class="form-control" placeholder="Lote" name="lote" aria-describedby="basic-addon2" id="txtPesquisa" />
                </div>
                <div class="col-md-5 col-sm-12 form-group">
                    <label for="data-entrada">Data de Entrada</label>
                    <input type="date" class="form-control" placeholder="Data de entrada" name="dataEntrada" aria-describedby="basic-addon2" id="txtPesquisa" />
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
                                    <th>Nome</th>
                                    <th>E-mail</th>
                                    <th>Ações</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:if test="${cliente != null}">
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
                                </c:if>
                                <c:if test="${cliente == null}">
                                    <tr class="no-paginate">
                                        <td colspan="4">Por favor, faça uma pesquisa ou entre com argumentos válidos.</td>
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

       
    </div>
    <%-- INCLUDE DO RODAPÉ --%>
    <%@include file="/includes/rodape.jsp" %>    
</body>
</html>