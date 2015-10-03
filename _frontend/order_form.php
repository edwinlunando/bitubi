<?php include '_header.php' ?>
<?php include '_menu.php' ?>

    <div class="wrapper">
        <div class="container">
            <div class="grid-flex">
                <div class="grid-flex top-mg">
                    <div class="grid-flex__col grid-flex__col-12 transaction-tabs">
                        <ol>
                            <li><span>1</span>Cart & Orders</li>
                            <li class="current"><span>2</span>Data Pemesanan</li>
                            <li><span>3</span>Pembayaran</li>
                        </ol>
                    </div>
                </div>
            </div>
            <div class="grid-flex">
                <div class="grid-flex__col grid-flex__col--12">
                    <div class="static-title np-top">
                        <center>
                            <h2 class="static-title__title">Form Pembayaran</h2>
                            <span class="category-title__detailed-description">
                                Silahkan mengisi alamat pengiriman dari pesanan Anda
                            </span>
                        </center>
                        <br>
                        <form action="" class="order-form">
                            <div class="form-row">
                                <label for="provinsi">Provinsi</label>
                                <select name="provinsi" id="">
                                    <option value="">-- Provinsi--</option>
                                    <option value="">DJ Akarta</option>
                                    <option value="">BD Lampung</option>
                                </select>
                            </div>
                            <div class="form-row">
                                <label for="kabupaten">Kabupaten: </label>
                                <select name="kabupaten" id="">
                                    <option value="">-- Kabupaten Kota --</option>
                                    <option value="">Raja Ampat</option>
                                    <option value="">Raja Singa</option>
                                </select>
                            </div>
                            <div class="form-row">
                                <label for="kecamatan">Kecamatan: </label>
                                <select name="kecamatan" id="">
                                    <option value="">-- Kecamatan --</option>
                                    <option value="">Waslilah</option>
                                    <option value="">Siantar Ujung</option>
                                </select>
                            </div>
                            <div class="form-row">
                                <label for="pengiriman">Jenis Pengiriman: </label>
                                <select name="pengiriman" id="">
                                    <option value="">-- Jenis Pengiriman --</option>
                                    <option value="">Dion Express</option>
                                    <option value="">Wiantar Express</option>
                                </select>
                            </div>
                            <div class="form-row">
                                <label for="pengiriman">Alamat: </label>
                                <input type="text" placeholder="Alamat lengkap">
                            </div>
                            <div class="form-row">
                                <label for="pengiriman">Pesan: </label>
                                <textarea name="pesan" rows="4" placeholder="Pesan pembeli"></textarea>
                            </div>
                            <br>
                            <center><button type="submit" class="btn btn-green">Bayar</button></center>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>  

<?php include '_footer.php' ?>