    <!-- =================== Navigation Menu =================== -->
    <header class="header-main">
        <nav class="main-navigation" role="navigation">
            <dl>
                <dt class="panel-group">
                    <a href="#">Account</a>
                </dt>   
                <dd class="panel-body">
                    <ul>
                        <li class="panel-profile">
                            <a href="##">
                                <figure>
                                    <div>
                                        <img class="lazy" data-original="assets/img/defaultpic.png" alt="profile-picture">
                                    </div>
                                    <figcaption>User's Name</figcaption>
                                </figure>
                            </a>
                        </li>
                        <li><a href="##">Pengaturan</a></li>
                        <li><a href="##">Cart</a></li>
                        <li><a href="##">Log Out</a></li>
                    </ul>
                </dd>
                <dt class="panel-group"><a href="#">Dompet</a></dt>
                <dd class="panel-body">
                    <ul>
                        <li><a><i class="fa fa-money fa-lg"> </i> <span> - Rp 0 </span></a></li>
                        <li><a href="##">Isi Dompet</a></li>
                    </ul>
                </dd>
                <dt><a href="#">Produk</a></dt>
                <dt class="panel-group">
                    <a href="#">Kategori Produk</a>
                </dt>   
                <dd class="panel-body">
                    <ul>
                        <li><a href="##">Automotif</a></li>
                        <li><a href="##">Elektronik</a></li>
                        <li><a href="##">Furniture</a></li>
                        <li><a href="##">Kesehatan</a></li>
                        <li><a href="##">Mesin</a></li>
                        <li><a href="##">Mainan</a></li>
                        <li><a href="##">Pakaian</a></li>
                        <li><a href="##">Lainnya</a></li>
                    </ul>
                </dd>
                <dt><a href="#">FAQ</a></dt>
                <dt><a href="#">Kontak Kami</a></dt>
            </dl>
        </nav><!-- /push menu right -->
        <div class="header-main__top-bar">
            <div class="nav-icon nav-toggle">
                <span></span>
                <span></span>
                <span></span>
            </div>
            <div class="header-logo">
                <h1 itemscope="" itemtype="http://schema.org/Organization">
                    <a itemprop="url">
                        <span class="icon icon-logo" itemprop="name">Larisni</span>
                    </a>
                </h1>
            </div>
            <div class="nav-lang nav-toggle">
                <div class="nav-lang__submenu">
                    <a href="" id="login-register-btn"><i class="fa fa-sign-in"></i> <span>Login / Register</span></a>
                </div>
                <!-- Change login to logout if user is already logged in -->
                <!-- <div class="nav-lang__submenu">
                    <a href=""><i class="fa fa-sign-out"></i> <span>Logout</span></a>
                </div> -->
                <div class="nav-lang__submenu">
                    <a href="" id="search-menu"><i class="fa fa-search"></i> <span>Search</span></a>
                </div>
                <div class="nav-lang__submenu nav-lang__submenu--square" id="cart-menu">
                    <a href="/keranjang"><i class="fa fa-shopping-cart"></i></a>
                </div>
            </div>
        </div>
    </header>
    <div class="menu-search__container">
        <div class="menu-search__form-row">
            <form action="">                
                <i class="fa fa-search"></i> <input type="text" placeholder="Search . . .">
            </form>
        </div>
    </div>
    <div class="login-register__container">
        <div class="login-register__form-container">
            <center class="login-register__close-btn">x</center>
            <center><h2 class="darkorange">Login</h2></center>
            <form action="" class="login-form">
                <input type="text" placeholder="Email">
                <input type="password" placeholder="Password">
                Belum punya akun ? <a href="">Daftar</a>
                <br><br>
                <center><input type="submit" class="btn btn-orange"></center>
            </form>
        </div>
    </div>
    <div class="overlay"></div>
    <!-- =============== End of Navigation Menu ================ -->

    <!-- Tambah class "message-error" di container kalau error -->
    <!-- <div class="grid-flex--no-pad page-notification--container">
        <div class="page-notification--message"> GG Well Played!!</div>
    </div> -->