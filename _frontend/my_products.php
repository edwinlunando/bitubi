<?php include '_header.php' ?>
<?php include '_menu.php' ?>

    <!-- ===================== Main Content ==================== -->
    <div class="wrapper">
        <div class="grid-flex--no-pad page-breadcrumb--container">
            <div class="grid-flex--no-gutter grid-flex__col--12 top-mg">
                <ul class="breadcrumb">
                    <li><a href="">Home</a></li>
                    <li><a href="">Profil</a></li>
                </ul>
            </div>
        </div>
        <div class="container">
            <div class="grid-flex">
                <div class="grid-flex__col grid-flex__col--12">
                    <div id="surfari-tabs">            
                        <ul class="nav">
                            <li class="nav-one">
                                <a href="#tab1">
                                    <i class="fa fa-user"></i> <span>Profil</span>
                                </a>
                            </li>
                            <li class="nav-two">
                                <a href="#tab2" class="current">
                                    <i class="fa fa-dropbox"></i> <span>Produk Dijual</span>
                                </a>
                            </li>
                            <li class="nav-three">
                                <a href="#tab3">
                                    <i class="fa fa-archive"></i> <span>Pesananmu</span>
                                </a>
                            </li>
                            <li class="nav-four">
                                <a href="#tab4">
                                    <i class="fa fa-shopping-cart"></i> <span>Cart & Order</span>
                                </a>
                            </li>
                        </ul>

                        <div class="list-wrap">
                            <h2 class="darkgreen">Your Products</h2>
                            <div class="table-container">
                                <p>
                                    <a href="" class="btn btn-green">Tambah Produk</a>
                                </p>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th align="center">Thumbnail</th>
                                            <th>Item</th>
                                            <th>Stok</th>
                                            <th>Tipe</th>
                                            <th>Harga</th>
                                            <th align="center">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td align="center"><img class="lazy" data-original="assets/img/caption-img.jpg" alt="" width="50"></td>
                                            <td><a href="">Pomeranian Puppy Bear Face For Sale Show Quality</a></td>
                                            <td>12</td>
                                            <td>Wholesale</td>
                                            <td align="right">3000000</td>
                                            <td align="center">
                                                <a href=""><i class="fa-btn btn-green fa fa-money" title="set sold"></i></a>
                                                <a href=""><i class="fa-btn btn-yellow fa fa-edit" title="edit"></i></a>
                                                <form action="" class="form-manage">
                                                    <button class="btn-clear" type="submit"><i class="fa-btn btn-red fa fa-trash" title="delete"></i></button>
                                                </form>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center"><img class="lazy" data-original="assets/img/caption-img.jpg" alt="" width="50"></td>
                                            <td><a href="">Pomeranian Puppy Bear Face For Sale Show Quality</a></td>
                                            <td>1</td>
                                            <td>Dropship</td>
                                            <td align="right">500000</td>
                                            <td align="center">
                                                <a href=""><i class="fa-btn btn-green fa fa-money" title="set sold"></i></a>
                                                <a href=""><i class="fa-btn btn-yellow fa fa-edit" title="edit"></i></a>
                                                <form action="" class="form-manage">
                                                    <button class="btn-clear" type="submit"><i class="fa-btn btn-red fa fa-trash" title="delete"></i></button>
                                                </form>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div> 
                    </div>
    <!-- =================== END OF LIST WRAP ================== -->
                </div>
            </div>
    <!-- ================= End of Main Content ================= -->
        </div>
    </div>  

<?php include '_footer.php' ?>