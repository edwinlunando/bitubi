<?php include '_header.php' ?>
<?php include '_menu.php' ?>

    <!-- ===================== Main Content ==================== -->
    <div class="wrapper">
        <div class="grid-flex--no-pad page-breadcrumb--container">
            <div class="grid-flex--no-gutter grid-flex__col--12 top-mg">
                <ul class="breadcrumb">
                    <li><a href="">Home</a></li>
                    <li><a href="">Profile</a></li>
                    <li><a href="">Add Products</a></li>
                </ul>
            </div>
        </div>
        <div class="container">
    <!-- ================ Caption Hover Style # ================ -->
            <div class="grid-flex">
                <div class="grid-flex__col grid-flex__col--12">
    <!-- ====================== LIST WRAP ====================== -->
                    <form action="" class="form__row">
                        <h2 class="orange">Tambah Produk</h2>

                        <div class="grid-flex">
                            <div class="grid-flex__col grid-flex__col--4">
                                <label class="form-label"><h3>Data</h3>
                                <label for="category" class="form-label">Kategori</label>
                                <select name="category" id="" class="form-select form-input--block">
                                    <option value="">-- Location --</option>
                                    <option value="1">DKI Jakarta</option>
                                    <option value="2">Jawa Barat</option>
                                </select>

                                <label for="name" class="form-label">Nama</label>
                                <input type="text" name="name" class="form-input form-input--block" placeholder="your name">

                                <label for="address" class="form-label">Deskripsi</label>
                                <textarea class="form-input form-input--block" name="description" placeholder="deskripsi" id="" rows="3"></textarea>
                                
                                <label for="stock" class="form-label">Stok</label>
                                <input type="number" name="stock" class="form-input form-input--block" placeholder="stock">

                                <label for="unit" class="form-label">Unit</label>
                                <input type="text" name="unit" class="form-input form-input--block" placeholder="unit">

                                <label for="weight" class="form-label">Berat</label>
                                <input type="number" name="weight" class="form-input form-input--block" placeholder="berat">

                                <label for="dropship-price" class="form-label">Harga Dropship</label>
                                <input type="number" name="dropship-price" class="form-input form-input--block" placeholder="harga dropship">
                            </div>
                            <div class="grid-flex__col grid-flex__col--4">
                                <label for="product-img" class="form-label"><h3>Gambar</h3></label>
                                <div>
                                    <img name="product-img[]" class="lazy" data-original="assets/img/no_image.gif" alt="" width="200"><br><br>
                                    <input type="file" name="profpic" id="prod-img" class="form-input form-input--block">
                                </div>
                                <br>
                                <button onclick="return false;" class="btn">Tambah Gambar</button>
                            </div> 
                            <div class="grid-flex__col grid-flex__col--4">
                                <label class="form-label"><h3>Wholesale Price</h3>
                                <div>
                                    <label for="wholesale_price" class="form-label">Harga</label>
                                    <input type="number" class="form-input" name="wholesale_price" placeholder="harga">
                                    <label for="min_quantity" class="form-label">Jumlah Minimum</label>
                                    <input type="number" class="form-input" name="min_quantity" placeholder="jumlah minimum">
                                    <label for="max_quantity" class="form-label">Jumlah Maksimum</label>
                                    <input type="number" class="form-input" name="max_quantity" placeholder="jumlah maximum">
                                    <br><br><hr>
                                </div>
                                <button onclick="return false;" class="btn">Tambah Wholesale</button>
                            </div> 
                        </div>
                        <div class="grid-flex">
                            <div class="grid-flex__col grid-flex__col--12">
                                <button class="btn btn-green" type="submit">Save</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
    <!-- ================= End of Main Content ================= -->
        </div>
    </div>  

<?php include '_footer.php' ?>