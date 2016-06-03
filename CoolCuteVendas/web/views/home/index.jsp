    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
    <head>
      <title>Home - Cool & Cute - Vendas</title>
      <%-- INCLUDE DO TOPO --%>
      <%@include file="/includes/topo.jsp" %>
      <style>
        .navbar {
          margin-bottom: 0px!important;

        }
        .logoHome{ position: absolute; left: 0; top: 0; width: 100%; max-width: 800px; max-height: 200px; height: 100%; display: none; }

      </style>
    </head>
    <body>
      <%-- INCLUDE DO MENU --%>
      <%@include file="/includes/menu.jsp" %>
      <!-- CONTEÚDO -->
      <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
          <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
          <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        </ol>
        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox"> 
            <div class="item active" id="animationBanner">
              <img src="/imagens/wp3.jpg" class="img-responsive" alt="" id="wp2"/>
              <div class="logoHome">
                  <img src="/imagens/logoHome.png" class="img-responsive">
              </div>
            </div>
            <div class="item">
                <img src="/imagens/wp1.jpg" class="img-responsive" alt="" />
                <div class="divContaineres">
                    <!-- div class container Vendas -->
                    <!-- __________________________________________________________________________________-->
                    <div class="row">
                        <div class="container-home" id="containerVendas">
                            <h3> Vendas </h3>
                            <div class="row">
                                <button class="btn btn-primary" type="button">
                                    Á Postar <span class="badge">4</span>
                                </button>
                            </div>
                            <br />
                            <div class="row">
                                <button class="btn btn-primary" type="button">
                                    Em trânsito <span class="badge">8</span>
                                </button>
                            </div>
                            <br />
                            <div class="row">
                                <button type="button" class="btn btn-mais">Mais +</button>
                            </div>
                            <!-- div class container saldo -->

                            <div class="container-home" id="containerSaldo">
                                <h3> Saldo </h3>
                                <div class="row">
                                    <p>Disponível :</p>
                                </div>
                                <br />
                                <div class="row">
                                    <p>Indisponível :</p>
                                </div>
                                <br />
                                <div class="row">
                                    <p>Em Mediação :</p>
                                </div>
                                <div class="row">
                                    <button type="button" class="btn btn-mais">Mais +</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- __________________________________________________________________________________-->
                    <!-- div class container mais vendidas-->
                    <div class="row">
                        <div class="container-home" id="containerMaisVendidas">
                            <h3> Mais Vendidas </h3>
                            <div class="row">
                                <p>Disponível :</p>
                            </div>
                            <br />
                            <div class="row">
                                <p>Indisponível :</p>
                            </div>
                            <br />
                            <div class="row">
                                <p>Em Mediação :</p>
                            </div>
                            <div class="row">
                                <button type="button" class="btn btn-mais">Mais +</button>
                            </div>
                        </div>
                        <!-- div class container mais ultimas movimentações-->
                        <div class="container-home" id="containerUltimasMovimentacoes">
                            <h3> Últimas Movimentações </h3>
                            <div class="row">
                                <p>Venda :</p>
                            </div>
                            <br />
                            <div class="row">
                                <p>Compra :</p>
                            </div>
                            <br />
                            <div class="row">
                                <button type="button" class="btn btn-mais">Mais +</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Controls -->
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next" id="btnProximaImagem">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
 


  <%-- INCLUDE DO RODAPÉ --%>
  <%@include file="/includes/rodape.jsp" %>   

    <script type="text/javascript">
    

        $(window).load(function(){
            logoAnimate();
        });

        //$('#btnProximaImagem').load(function(){

            //logoAnimate();
        // })

        function logoAnimate(){
            var widthBanner = $('#animationBanner').width();
            var heightBanner = $('#animationBanner').height();

         $('.logoHome')
                .css("color","#f33")
                .hide()
                .delay('1000')
                .fadeIn('slow')
                .delay('10');

                $('.logoHome').animate({left: (widthBanner/2) - ($('.logoHome').width()/2)}, 'slow');
                $('.logoHome').animate({top : (heightBanner/2) - ($('.logoHome').height()/2)}, 'slow', function(){
                    $(this).css({
                        margin: 'auto',
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: 0
                    });            
                });
        }
    </script>
</body>
</html>






