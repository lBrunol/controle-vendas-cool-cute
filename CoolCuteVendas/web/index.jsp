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
          <li data-target="#carousel-example-generic" data-slide-to="2"></li>
        </ol>



        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">  



          <div class="item active">  

            <img src="imagens/wp1.jpg" class="img-responsive" alt="" width="1349" height="1100"/  
            <!-- __________________________________________________________________________________-->
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
                <br/>
                <div class="row">
                  <button class="btn btn-primary" type="button">
                    Em trânsito <span class="badge">8</span>
                  </button>
                </div>
                <br/>
                <div class="row">
                  <button type="button" class="btn btn-mais">Mais +</button>
                </div>
                <!-- div class container saldo -->

                <div class="container-home" id="containerSaldo">
                  <h3> Saldo </h3>
                  <div class="row">
                    <p>Disponível :</p>
                  </div>
                  <br/>
                  <div class="row">
                    <p>Indisponível :</p>
                  </div>
                  <br/>
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
              <br/>
              <div class="row">
                <p>Indisponível :</p>
              </div>
              <br/>
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
              <br/>
              <div class="row">
                <p>Compra :</p>
              </div>
              <br/>
              <div class="row">
                <button type="button" class="btn btn-mais">Mais +</button>
              </div>
            </div>
          </div>


        </div>

      </div>


      <div class="item">

        <img src="imagens/wp3.jpg" class="img-responsive" alt="" width="1349" height="1100"/>

        <div class="logo_icone"> </div>
        
      </div>



      

      <!-- Controls -->
      <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>


  </div>
  </div>



  <!--______________________________________________-->



  <!--________________________________________________-->







  <%-- INCLUDE DO RODAPÉ --%>
  <%@include file="/includes/rodape.jsp" %>   


  </body>
  </html>






