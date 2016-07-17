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
                                <a href="#tab1" class="current">
                                    <i class="fa fa-user"></i> <span>Profil</span>
                                </a>
                            </li>
                            <li class="nav-two">
                                <a href="#tab2">
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
                            <form action="" class="form__row">
                                <h2 class="orange">Edit Profile</h2>
                                <div class="grid-flex">
                                    <div class="grid-flex__col grid-flex__col--6">
                                        <label for="name" class="form-label">Name</label>
                                        <input type="text" name="name" class="form-input form-input--block form-input--error" placeholder="your name">
                                        <span class="form-input--error-message">Salah bro</span>
                                        
                                        <label for="email" class="form-label">Email</label>
                                        <input type="email" name="email" class="form-input form-input--block" placeholder="your email">

                                        <label for="password" class="form-label">Password</label>
                                        <input type="password" name="email" class="form-input form-input--block" placeholder="change password">

                                        <label for="phone" class="form-label">Phone Number</label>
                                        <input type="text" name="phone" class="form-input form-input--block" placeholder="phone number">

                                        <label for="province" class="form-label">Provinsi</label>
                                        <select name="province" id="" class="form-select form-input--block">
                                            <option value="">-- Location --</option>
                                            <option value="1">DKI Jakarta</option>
                                            <option value="2">Jawa Barat</option>
                                        </select>

                                        <label for="kabupaten" class="form-label">Kota</label>
                                        <select name="kabupaten" id="" class="form-select form-input--block">
                                            <option value="">-- Location --</option>
                                            <option value="1">DKI Jakarta</option>
                                            <option value="2">Jawa Barat</option>
                                        </select>

                                        <label for="kecamatan" class="form-label">Kecamatan</label>
                                        <select name="kecamatan" id="" class="form-select form-input--block">
                                            <option value="">-- Location --</option>
                                            <option value="1">DKI Jakarta</option>
                                            <option value="2">Jawa Barat</option>
                                        </select>

                                        <label for="address" class="form-label">Alamat</label>
                                        <textarea class="form-input form-input--block" name="address" placeholder="alamat lengkap" id="" rows="3"></textarea>
                                    </div> 
                                    <div class="grid-flex__col grid-flex__col--6">
                                        <label for="profpic" class="form-label"><h3>Profile Picture</h3></label>
                                        <img class="lazy" data-original="assets/img/no_image.gif" alt="" id="profpic-target" width="200">
                                        <br><br>
                                        <input type="file" name="profpic" id="profpic" class="form-input form-input--block"><br>
                                        <span class="black">recommended image: width = height</span>
                                    </div> 
                                </div>
                                <div class="grid-flex">
                                    <div class="grid-flex__col grid-flex__col--12">
                                        <button class="btn btn-green" type="submit">Save</button>
                                    </div>
                                </div>
                            </form>
                            <hr>
                        </div> 
                    </div>
    <!-- =================== END OF LIST WRAP ================== -->
                </div>
            </div>
    <!-- ================= End of Main Content ================= -->
        </div>
    </div>  

<?php include '_footer.php' ?>