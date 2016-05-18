<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
    <head>
        <title>Login - Cool & Cute - Vendas</title>
        <%-- INCLUDE DO TOPO --%>
        <%@include file="/includes/topo.jsp" %>
        <style>            
              .login-animate-1 { opacity: 0; animation: fadeIn 1s linear forwards; }
              .login-animate-1 img { float: right; }

              .login-animate-2 { opacity: 0; animation: fadeIn 1s linear 0.5s forwards; }

              @keyframes fadeIn {
                  100% { opacity: 1; }
              }
        </style>
    </head>
    <body>       
        <%-- CONTEÚDO --%>
        <div class="container content">
            <div class="container-login">
                <form action="/login" method="POST" id="formLogin">
                    <div class="col-md-12 login-animate-1">
                      <img src="/imagens/logo.png" alt="Cool &amp; Cute" />
                    </div>
                    <div class="col-md-12 form-group login-animate-2">
                        <label for="login">Login</label>
                        <input type="text" name="login" class="form-control" />
                    </div>
                    <div class="col-md-12 form-group login-animate-2">
                        <label for="senha">Senha</label>
                        <input type="text" name="senha" class="form-control" />
                    </div>
                    <div class="col-md-12 form-group login-animate-2">
                        <button type="submit" class="btn btn-mais"><i class="fa fa-chevron-circle-right" aria-hidden="true"></i> Entrar</button>
                    </div>
                </form>
            </div>
        </div>
        <script type="text/javascript" src="/js/jquery-2.2.3.min.js"></script>
        <script type="text/javascript" src="/js/jquery.validate.min.js"></script>
        
        <script type="text/javascript">
            $('#formLogin').validate({
                errorPlacement: function(error, element) {
                $( element )
                    .closest( "form" )
                        .find( "label[for='" + element.attr( "name" ) + "']" )
                            .append( error );                
                },
                errorElement: "span",
                rules: {
                    login: "required",
                    senha: "required"
                }, 
                messages: {
                    login: "Por favor, insira um nome válido",
                    senha: "Por favor, preencha com uma senha válida"
                }
            });
        </script>
    </body>
</html>
