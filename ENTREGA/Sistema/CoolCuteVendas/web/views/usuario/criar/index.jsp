<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Cadastro de Usuário - Cool & Cute - Vendas</title>
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
            <li><a href="#">Usuário</a></li>
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
                    <form:errors path="usuario.*" />
                </div>
            </c:if>
        </c:if>
        <h2>Cadastro de Usuário</h2>
        <hr>
        <form method="post" action="/adicionarAlterarUsuario" id="formUsuario">
            <div class="row">
                <div class="hidden">
                    <c:choose>
                        <c:when test="${not empty usuario.getCodigo()}">
                          <input type="hidden" name="codigo" value="${usuario.getCodigo()}" />
                        </c:when>
                        <c:otherwise>
                          <input type="hidden" name="codigo" value="0" />
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6 col-sm-6">
                    <label for="login">Login</label>
                    <input type="text" class="form-control" name="login" id="login" value="${usuario.getLogin()}" />
                </div>                
            </div>
            <div class="row">
                <div class="form-group col-md-6 col-sm-6">
                    <label for="senha">Senha</label>
                    <input type="password" class="form-control" name="senha" value="${usuario.getSenha()}" id="txtSenha" />
                </div> 
                <div class="form-group col-md-6 col-sm-6">
                    <label for="confirmaSenha">Confirme a Senha</label>
                    <input type="password" class="form-control" name="confirmaSenha" value="${usuario.getConfirmaSenha()}" />
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-4 col-sm-6">
                    <label for="administrador" class="radio-check">Administrador</label>
                    <input type="checkbox" name="administrador" id="chkAdministrador" />
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
                    <a role="button" href="/usuario/consultar/" class="btn btn-vermelho margin-std-top"><i class="fa fa-fw fa-chevron-left"></i> Voltar</a>
                </div>
            </div>
        </form>
    </div>    
    <%-- INCLUDE DO RODAPÉ --%>
    <%@include file="/includes/rodape.jsp" %>
    <script type="text/javascript">
        $(function (){
            
            var response;
            $.validator.addMethod(
                "uniqueUserName", 
                function(value, element) {
                    $.ajax({
                        type: 'get',
                        headers: {
                            Accept: 'application/json; charset=utf-8',
                            'Content-Type': 'application/json; charset=utf-8'
                        },
                        url: '/servicoConsultaLoginUsuario/' + $('#login').val(),                        
                        success: function(data){
                            response = (data == false) ? true : false;
                        }
                     });
                    return response;
                },
                "Este usuário já existe"
            );
                        
            $("#formUsuario").validate({
                errorPlacement: function(error, element) {
                $( element )
                    .closest( "form" )
                        .find( "label[for='" + element.attr( "name" ) + "']" )
                            .append( error );                
                },
                errorElement: "span",
                rules: {
                    login: {
                        required: true,
                        uniqueUserName: true
                    },
                    senha: "required",
                    confirmaSenha: {
                        equalTo: "#txtSenha",
                        required: true
                    }
                },
                messages: {
                    login: {
                        required: "Por favor, preencha a descrição",
                        uniqueUserName: "Este usuário já existe"
                    },
                    senha: "Por favor, preencha a senha",
                    confirmaSenha: {
                        required: "Por favor, confirme a senha",
                        equalTo: "A senha digitada nos dois campos devem ser iguais"
                    }
                }     
            });
            
        });        
        <c:if test="${usuario.isAdministrador() == true}">
            var administrador = ${usuario.isAdministrador()};

            if (administrador == true){
                document.getElementById('chkAdministrador').checked = true;
            }
        </c:if>
        <c:if test="${usuario.isAdministrador() == false}">
            var administrador = ${usuario.isAdministrador()};

            if (administrador == true){
                document.getElementById('chkAdministrador').checked = false;
            }
        </c:if>        
    </script>   
</body>
</html>