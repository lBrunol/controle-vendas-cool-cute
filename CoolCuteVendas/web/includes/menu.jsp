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
                                            <a href="/pedido/consultar/"><i class="fa fa-search fa-fw"></i> Consultar</a>
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
                                            <a href="/cliente/consultar/"><i class="fa fa-search fa-fw"></i> Consultar</a>
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
                                            <a href="/entrada/consultar/"><i class="fa fa-search fa-fw"></i> Consultar</a>
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
                                            <a href="/movimentacao/consultar/"><i class="fa fa-search fa-fw"></i> Consultar</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Outros Itens <i class="fa fa-fw fa-caret-down"></i></a>
                                    <ul class="dropdown-menu">
                                        <li class="dropdown">
                                            <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Anúncios <i class="fa fa-fw fa-caret-down"></i></a>
                                            <ul class="dropdown-menu sub-menu">
                                                <li><a href="/anuncio/criar/"><i class="fa fa-pencil-square-o fa-fw"></i> Criar/Editar</a></li>
                                                <li><a href="/anuncio/consultar/"><i class="fa fa-search fa-fw"></i> Consultar</a></li>
                                            </ul>
                                        </li>
                                        <li class="dropdown">
                                            <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Status do Anúncios <i class="fa fa-fw fa-caret-down"></i></a>
                                            <ul class="dropdown-menu sub-menu">
                                                <li><a href="/status-anuncio/criar/"><i class="fa fa-pencil-square-o fa-fw"></i> Criar/Editar</a></li>
                                                <li><a href="/status-anuncio/consultar/"><i class="fa fa-search fa-fw"></i> Consultar</a></li>
                                            </ul>
                                        </li>
                                        <li class="dropdown">
                                            <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Tipos de Anúncios <i class="fa fa-fw fa-caret-down"></i></a>
                                            <ul class="dropdown-menu sub-menu">
                                                <li><a href="/tipo-anuncio/criar/"><i class="fa fa-pencil-square-o fa-fw"></i> Criar/Editar</a></li>
                                                <li><a href="/tipo-anuncio/consultar/"><i class="fa fa-search fa-fw"></i> Consultar</a></li>
                                            </ul>
                                        </li>
                                        <li class="dropdown">
                                            <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Tipos de Avaliação <i class="fa fa-fw fa-caret-down"></i></a>
                                            <ul class="dropdown-menu sub-menu">
                                                <li><a href="/tipo-avaliacao/criar/"><i class="fa fa-pencil-square-o fa-fw"></i> Criar/Editar</a></li>
                                                <li><a href="/tipo-avaliacao/consultar/"><i class="fa fa-search fa-fw"></i> Consultar</a></li>
                                            </ul>
                                        </li>
                                        <li class="dropdown">
                                            <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Status Pedido <i class="fa fa-fw fa-caret-down"></i></a>
                                            <ul class="dropdown-menu sub-menu">
                                                <li><a href="/status-pedido/criar/"><i class="fa fa-pencil-square-o fa-fw"></i> Criar/Editar</a></li>
                                                <li><a href="/status-pedido/consultar/"><i class="fa fa-search fa-fw"></i> Consultar</a></li>
                                            </ul>
                                        </li>
                                        <li class="dropdown">
                                            <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Tipos Movimentação <i class="fa fa-fw fa-caret-down"></i></a>
                                            <ul class="dropdown-menu sub-menu">
                                                <li><a href="/tipo-movimentacao/criar/"><i class="fa fa-pencil-square-o fa-fw"></i> Criar/Editar</a></li>
                                                <li><a href="/tipo-movimentacao/consultar/"><i class="fa fa-search fa-fw"></i> Consultar</a></li>
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