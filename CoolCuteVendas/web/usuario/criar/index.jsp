<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <h2>Cadastro de Usuário</h2>
        <hr>
        <form method="post" action="javascript:void(0);" id="formUsuario">
            <div class="row">
                <div class="form-group col-md-6 col-sm-6">
                    <label for="txtLogin">Login</label>
                    <input type="text" class="form-control" name="txtLogin" />
                </div>                
            </div>
            <div class="row">
                <div class="form-group col-md-6 col-sm-6">
                    <label for="txtSenha">Senha</label>
                    <input type="password" class="form-control" name="txtSenha" id="txtSenha" />
                </div> 
                <div class="form-group col-md-6 col-sm-6">
                    <label for="txtConfirmeSenha">Confirme a Senha</label>
                    <input type="password" class="form-control" name="txtConfirmeSenha" />
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-4 col-sm-6">
                    <label for="chkAdministrador" class="radio-check">Administrador</label>
                    <input type="checkbox" name="chkAdministrador" />
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
                    <button type="button" class="btn btn-vermelho margin-std-top"><i class="fa fa-fw fa-chevron-left"></i> Voltar</button>
                </div>
            </div>
        </form>
    </div>    
    <%-- INCLUDE DO RODAPÉ --%>
    <%@include file="/includes/rodape.jsp" %>
    <script type="text/javascript">
        /* Validação dos campos do formulário */
        $("#formUsuario").validate({
            errorPlacement: function(error, element) {
            $( element )
                .closest( "form" )
                    .find( "label[for='" + element.attr( "name" ) + "']" )
                        .append( error );                
            },
            errorElement: "span",
            rules: {
                txtLogin: "required",
                txtSenha: "required",
                txtConfirmeSenha: {
                    equalTo: "#txtSenha",
                    required: true
                }
            },
            messages: {
                txtLogin: "Por favor, preencha a descrição",
                txtSenha: "Por favor, preencha a senha",
                txtConfirmeSenha: {
                    required: "Por favor, confirme a senha",
                    equalTo: "A senha digitada nos dois campos devem ser iguais"
                }
            }     
        });
    </script>
</body>
</html>