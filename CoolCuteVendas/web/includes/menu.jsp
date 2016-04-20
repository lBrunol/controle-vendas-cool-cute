<%@page contentType="text/html" pageEncoding="UTF-8"%>    
    <div class="container-fluid">
        <div class="row">
            <nav class="navbar navbar-default">
                <div class="container">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <div class="logo">
                                <a href="/">
                                    <img src="/imagens/logo.png" alt="Cool & Cute" />
                                </a>
                            </div>
                        </div>
                        <div class="collapse navbar-collapse navbar-ex1-collapse">
                            <ul class="nav navbar-nav side-nav">
                                <li class="dropdown">
                                    <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Pedidos <i class="fa fa-fw fa-caret-down"></i></a>
                                    <ul class="dropdown-menu">
                                        <li>
                                            <a href="/pedido/criar/"><i class="fa fa-pencil-square-o fa-fw"></i> Criar/Editar</a>
                                        </li>
                                        <li>
                                            <a href="/pedido/consultar/"><i class="fa fa-search-plus fa-fw"></i> Consultar</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Clientes <i class="fa fa-fw fa-caret-down"></i></a>
                                    <ul class="dropdown-menu">
                                        <li>
                                            <a href="/cliente/criar/"><i class="fa fa-pencil-square-o fa-fw"></i> Criar/Editar</a>
                                        </li>
                                        <li>
                                            <a href="/cliente/consultar/"><i class="fa fa-search-plus fa-fw"></i> Consultar</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Entradas <i class="fa fa-fw fa-caret-down"></i></a>
                                    <ul class="dropdown-menu">
                                        <li>
                                            <a href="/entrada/criar/"><i class="fa fa-pencil-square-o fa-fw"></i> Criar/Editar</a>
                                        </li>
                                        <li>
                                            <a href="/entrada/consultar/"><i class="fa fa-search-plus fa-fw"></i> Consultar</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Movimentações <i class="fa fa-fw fa-caret-down"></i></a>
                                    <ul class="dropdown-menu">
                                        <li>
                                            <a href="/movimentacao/criar/"><i class="fa fa-pencil-square-o fa-fw"></i> Criar/Editar</a>
                                        </li>
                                        <li>
                                            <a href="/movimentacao/consultar/"><i class="fa fa-search-plus fa-fw"></i> Consultar</a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="javascript:;" data-toggle="collapse" data-target=".sub-nav-outros">Outros Itens <i class="fa fa-fw fa-caret-down"></i></a>
                                    <ul class="sub-nav-outros collapse">
                                        <li>
                                            <a href="javascript:;" data-toggle="collapse" data-target=".sub-nav2-anuncio">Anúncios</a>
                                            <ul class="sub-nav2-anuncio collapse">
                                                <li><a href="/anuncio/criar/">Criar/Editar</a></li>
                                                <li><a href="/anuncio/consultar/">Consultar</a></li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="javascript:;" data-toggle="collapse" data-target=".sub-nav2-sta-anuncio">Status do Anúncios</a>
                                            <ul class="sub-nav2-sta-anuncio collapse">
                                                <li><a href="/status-anuncio/criar/">Criar/Editar</a></li>
                                                <li><a href="/status-anuncio/consultar/">Consultar</a></li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="javascript:;" data-toggle="collapse" data-target=".sub-nav2-tip-anuncio">Tipos de Anúncios</a>
                                            <ul class="sub-nav2-tip-anuncio collapse">
                                                <li><a href="/tipo-anuncio/criar/">Criar/Editar</a></li>
                                                <li><a href="/tipo-anuncio/consultar/">Consultar</a></li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="javascript:;" data-toggle="collapse" data-target=".sub-nav2-tip-avaliacao">Tipos de Avaliação</a>
                                            <ul class="sub-nav2-tip-avaliacao collapse">
                                                <li><a href="/tipo-avaliacao/criar/">Criar/Editar</a></li>
                                                <li><a href="/tipo-avaliacao/consultar/">Consultar</a></li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="javascript:;" data-toggle="collapse" data-target=".sub-nav2-sta-pedido">Status Pedido</a>
                                            <ul class="sub-nav2-sta-pedido collapse">
                                                <li><a href="/status-pedido/criar/">Criar/Editar</a></li>
                                                <li><a href="/status-pedido/consultar/">Consultar</a></li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="javascript:;" data-toggle="collapse" data-target=".sub-nav2-tip-movimentacao">Tipos Movimentação</a>
                                            <ul class="sub-nav2-tip-movimentacao collapse">
                                                <li><a href="/tipo-movimentacao/criar/">Criar/Editar</a></li>
                                                <li><a href="/tipo-movimentacao/consultar/">Consultar</a></li>
                                            </ul>
                                        </li>                                        
                                    </ul>
                                </li>
                            </ul>
                            <div class="usuario">
                                <ul class="nav navbar-nav navbar-right">
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-user"></i> Bruno Alves <b class="caret"></b></a>
                                        <ul class="dropdown-menu">
                                            <li>
                                                <a href="#"><i class="fa fa-fw fa-user"></i>Perfil</a>
                                            </li>
                                            <li class="divider"></li>
                                            <li>
                                                <a href="#"><i class="fa fa-fw fa-power-off"></i> Sair</a>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div>
                </div>
            </nav>
        </div>
    </div>