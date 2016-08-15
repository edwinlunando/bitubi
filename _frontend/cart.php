<?php include '_header.php' ?>
<?php include '_menu.php' ?>

    <div class="wrapper">
        <div class="container">
            <div class="grid-flex">
                <div class="grid-flex top-mg">
                    <div class="grid-flex__col grid-flex__col-12 transaction-tabs">
                        <ol>
                            <li class="current"><span>1</span>Cart & Orders</li>
                            <li><span>2</span>Data Peme sanan</li>
                            <li><span>3</span>Pembayaran</li>
                        </ol>
                    </div>
                </div>
            </div>
            <div class="grid-flex">
                <div class="grid-flex__col grid-flex__col--12">
                    <div id="surfari-tabs">            
                        <ul class="nav">
                            <li class="nav-one">
                                <a href="#tab1" class="current">
                                    <i class="fa fa-shopping-cart"></i> <span> Cart</span>
                                </a>
                            </li>
                            <li class="nav-two">
                                <a href="#tab2">
                                    <i class="fa fa-phone"></i> <span> Orders</span>
                                </a>
                            </li>
                        </ul>

                        <div class="list-wrap">
                            <div id="tab1">
                                <div class="flex-grid">
                                    <div class="flex-grid__col flex-grid__col--12">
                                        <h2 class="darkorange">YOUR CART</h2>
                                        <div class="table-container">
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th align="center">Thumbnail</th>
                                                        <th>Item</th>
                                                        <th>Jumlah</th>
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
                                                            <form action="" class="form-manage">
                                                                <button class="btn-clear" type="submit"><i class="fa-btn btn-red fa fa-trash" title="delete"></i></button>
                                                            </form>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                                <tfoot>
                                                    <tr>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td><b>Total</b></td>
                                                        <td align="right"><b>3500000</b></td>
                                                        <td align="center">
                                                            <form action="">
                                                                <input type="hidden">
                                                                <button class="btn btn-green"><i class="fa fa-money"></i> Checkout</button>
                                                            </form>
                                                        </td>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="hide" id="tab2">
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
                                                            <button class="btn-clear order-expandable" data-target="orderb"><i class="fa-btn btn-green fa fa-folder-open" title="view"></i></button>
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
                                                            <button class="btn-clear order-expandable" data-target="ordera"><i class="fa-btn btn-green fa fa-folder-open" title="view"></i></button>
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
                        </div> 
                    </div>
                </div>
            </div>
        </div>
    </div>  

<?php include '_footer.php' ?>