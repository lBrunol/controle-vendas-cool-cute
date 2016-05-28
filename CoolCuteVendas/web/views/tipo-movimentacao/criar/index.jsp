<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Cadastro de Tipo de Movimentação - Cool & Cute - Vendas</title>
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
            <li><a href="#">Tipo de Movimentação</a></li>
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
                    <form:errors path="tipoMovimentacao.*" />
                </div>
            </c:if>
        </c:if>
        <h2>Cadastro de Tipo de Movimentação</h2>
        <hr>
        <form method="post" action="/adicionarAlterarTipoMovimentacao" id="formTipoMovimentacao">
            <div class="row">
                <div class="hidden">
                    <c:choose>
                        <c:when test="${not empty tipoMovimentacao.codigo}">
                          <input type="hidden" name="codigo" value="${tipoMovimentacao.codigo}" />
                        </c:when>
                        <c:otherwise>
                          <input type="hidden" name="codigo" value="0" />
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="form-group col-md-6 col-sm-6">
                    <label for="descricao">Descrição</label>
                    <input type="text" class="form-control" name="descricao" value="${tipoMovimentacao.getDescricao()}"/>
                </div>
                <div class="form-group col-md-6 col-sm-6">
                    <label for="operacao">Operação</label>
                    <select class="form-control" name="operacao" id="operacao">
                        <option value="true">Entrada</option>
                        <option value="false">Saída</option>
                    </select>
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
                    <a role="button" href="/tipo-movimentacao/consultar/" class="btn btn-vermelho margin-std-top"><i class="fa fa-fw fa-chevron-left"></i> Voltar</a>
                </div>
            </div>
        </form>
    </div>    
    <%-- INCLUDE DO RODAPÉ --%>
    <%@include file="/includes/rodape.jsp" %>
    <script type="text/javascript">
        /* Validação dos campos do formulário */
        $("#formTipoMovimentacao").validate({
            errorPlacement: function(error, element) {
            $( element )
                .closest( "form" )
                    .find( "label[for='" + element.attr( "name" ) + "']" )
                        .append( error );                
            },
            errorElement: "span",
            rules: {
                descricao: "required"
            },
            messages: {
                descricao: "Por favor, preencha a descrição"
            }     
        });
        <c:if test="${tipoMovimentacao.getDescricao() != null }">
            var dd = document.getElementById('operacao');
            var opts = dd.options.length;
            var value = ${tipoMovimentacao.isOperacao()};
            value = value + '';
            for (var i=0; i<opts; i++){
                if (dd.options[i].value == value){
                    dd.options[i].selected = true;
                    break;
                }
            }
        </c:if>        
    </script>    
</body>
</html>