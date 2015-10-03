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
                    <div class="grid-flex__col grid-flex__col--6">
                        <label for="profpic" class="form-label"><h3>Login</h3></label>
                        <form action="" class="form__row">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" name="email" class="form-input form-input--block" placeholder="your email">

                            <label for="password" class="form-label">Password</label>
                            <input type="password" name="email" class="form-input form-input--block" placeholder="change password">
                            
                            <br><br>
                            <button class="btn btn-green" type="submit">Login</button>
                        </form>
                    </div> 
                    <div class="grid-flex__col grid-flex__col--6">
                        <label for="profpic" class="form-label"><h3>Daftar Baru</h3></label>
                        <form action="">
                            <label for="type" class="form-label">Tipe Pendaftaran</label>
                            <select name="type" id="" class="form-select form-input--block">
                                <option value="">-- Daftar Sebagai --</option>
                                <option value="buyer" data-registrar="pembeli">Pembeli</option>
                                <option value="vendor" data-registrar="vendor">Vendor</option>
                            </select>

                            <label for="name" class="form-label">Name</label>
                            <input type="text" name="name" class="form-input form-input--block form-input--error" placeholder="your name">
                            <span class="form-input--error-message">Salah bro</span>
                            
                            <label for="email" class="form-label">Email</label>
                            <input type="email" name="email" class="form-input form-input--block" placeholder="your email">

                            <label for="password" class="form-label">Password</label>
                            <input type="password" name="email" class="form-input form-input--block" placeholder="change password">

                            <label for="phone" class="form-label">Phone Number</label>
                            <input type="text" name="phone" class="form-input form-input--block" placeholder="phone number">

                            <label for="norek" class="form-label">Nomor Rekening</label>
                            <input type="text" name="norek" class="form-input form-input--block" placeholder="nomor rekening">

                            <label for="address" class="form-label">Alamat</label>
                            <textarea class="form-input form-input--block" name="address" placeholder="alamat lengkap" id="" rows="3"></textarea>
                            
                            <br><br>
                            <button class="btn btn-green" type="submit">Daftar</button>
                        </form>
                    </div> 
                </div>
            </div>
    <!-- ================= End of Main Content ================= -->
        </div>
    </div>  

<?php include '_footer.php' ?>