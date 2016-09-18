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
                                <a href="#tab2">
                                    <i class="fa fa-dropbox"></i> <span>Produk Dijual</span>
                                </a>
                            </li>
                            <li class="nav-three">
                                <a href="#tab3" class="current">
                                    <i class="fa fa-archive"></i> <span>Pesananmu</span>
                                </a>
                            </li>
                            <li class="nav-four">
                                <a href="#tab4">
                                    <i class="fa fa-shopping-cart"></i> <span>Cart & Order</span>
                                </a>
                            </li>
                        </ul>

                        <div class="flex-grid">
                            <div class="flex-grid__col flex-grid__col--12">
                                <h2 class="darkorange">YOUR ORDERS</h2>
                                <div class="table-container">
                                    <table class="table">
                                        <thead>
                                            <tr align="center">
                                                <th>Order Id</th>
                                                <th>Jumlah Item</th>
                                                <th>Total</th>
                                                <th>Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr align="center">
                                                <td>ASD123</td>
                                                <td>12</td>
                                                <td align="right">3000000</td>
                                                <td>On Delivery</td>
                                                <td align="center">
                                                    <button class="btn-clear order-expandable" data-target="orderb"><i class="fa-btn btn-black fa fa-folder-open" title="view"></i></button>
                                                    <a href=""><i class="fa-btn btn-yellow fa fa-truck" title="kirim"></i></a>
                                                    <a href=""><i class="fa-btn btn-green fa fa-money" title="sampai"></i></a>
                                                    <form action="" class="form-manage">
                                                        <button class="btn-clear" type="submit"><i class="fa-btn btn-red fa fa-ban" title="batalkan"></i></button>
                                                    </form>
                                                </td>
                                            </tr>
                                            <tr id="orderb" class="none">
                                                <td colspan="5">
                                                    <table class="table">
                                                        <thead>
                                                            <tr>
                                                                <th align="center">Thumbnail</th>
                                                                <th>Item</th>
                                                                <th>Jumlah</th>
                                                                <th>Tipe</th>
                                                                <th>Harga</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td align="center"><img class="lazy" data-original="assets/img/caption-img.jpg" alt="" width="50"></td>
                                                                <td><a href="">Pomeranian Puppy Bear Face For Sale Show Quality</a></td>
                                                                <td>12</td>
                                                                <td>Wholesale</td>
                                                                <td align="right">3000000</td>
                                                            </tr>
                                                            <tr>
                                                                <td align="center"><img class="lazy" data-original="assets/img/caption-img.jpg" alt="" width="50"></td>
                                                                <td><a href="">Pomeranian Puppy Bear Face For Sale Show Quality</a></td>
                                                                <td>1</td>
                                                                <td>Dropship</td>
                                                                <td align="right">500000</td>
                                                            </tr>
                                                        </tbody>
                                                        <tfoot>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td><b>Total</b></td>
                                                                <td align="right"><b>3500000</b></td>
                                                            </tr>
                                                        </tfoot>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr align="center">
                                                <td>ASD123</td>
                                                <td>12</td>
                                                <td align="right">3000000</td>
                                                <td>On Delivery</td>
                                                <td align="center">
                                                    <button class="btn-clear order-expandable" data-target="ordera"><i class="fa-btn btn-black fa fa-folder-open" title="view"></i></button>
                                                    <a href=""><i class="fa-btn btn-yellow fa fa-truck" title="kirim"></i></a>
                                                    <a href=""><i class="fa-btn btn-green fa fa-money" title="sampai"></i></a>
                                                    <form action="" class="form-manage">
                                                        <button class="btn-clear" type="submit"><i class="fa-btn btn-red fa fa-ban" title="batalkan"></i></button>
                                                    </form>
                                                </td>
                                            </tr>
                                            <tr id="ordera" class="none">
                                                <td colspan="5">
                                                    <table class="table">
                                                        <thead>
                                                            <tr>
                                                                <th align="center">Thumbnail</th>
                                                                <th>Item</th>
                                                                <th>Jumlah</th>
                                                                <th>Tipe</th>
                                                                <th>Harga</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td align="center"><img class="lazy" data-original="assets/img/caption-img.jpg" alt="" width="50"></td>
                                                                <td><a href="">Pomeranian Puppy Bear Face For Sale Show Quality</a></td>
                                                                <td>12</td>
                                                                <td>Wholesale</td>
                                                                <td align="right">3000000</td>
                                                            </tr>
                                                            <tr>
                                                                <td align="center"><img class="lazy" data-original="assets/img/caption-img.jpg" alt="" width="50"></td>
                                                                <td><a href="">Pomeranian Puppy Bear Face For Sale Show Quality</a></td>
                                                                <td>1</td>
                                                                <td>Dropship</td>
                                                                <td align="right">500000</td>
                                                            </tr>
                                                        </tbody>
                                                        <tfoot>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td><b>Total</b></td>
                                                                <td align="right"><b>3500000</b></td>
                                                            </tr>
                                                        </tfoot>
                                                    </table>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
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