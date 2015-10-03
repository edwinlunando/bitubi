<?php include '_header.php' ?>
<?php include '_menu.php' ?>

    <div class="wrapper">
        <div class="container">
            <div class="grid-flex">
                <div class="grid-flex__col grid-flex__col--12 top-mg">
                    <div class="static-title np-top">
                        <center>
                            <h2 class="static-title__title">Pengisian Dompet</h2>
                            <span class="category-title__detailed-description">
                                Silahkan isi form berikut untuk konfirmasi pengisian dompet Anda
                            </span>
                        </center>
                        <br>
                        <div class="grid-flex">
                            <div class="grid-flex__col grid-flex__col--6">
                                <h3 class="darkgreen">Instruksi</h3>
                                <span>Silahkan transfer ke rekening yang tersedia di bawah dan konfirmasi dengan mengisi form di samping</span>
                                <ol class="instruction-set">
                                    <li> 
                                        <b>Rekening BCA</b>                     
                                        <div class="clear-pm">
                                            <img src="http://4.bp.blogspot.com/-RuTSlvffghg/UNrQJUqjjaI/AAAAAAAAAFg/4krs0UxBObo/s1600/logo_bca.png" alt="" width="80">
                                            <div>
                                                <b>
                                                    080 989 4444<br>
                                                    a.n. PT Laris Banget Nich
                                                </b>
                                            </div>
                                        </div>
                                    </li>
                                    <li> 
                                        <b>Rekening Mandiri</b>                     
                                        <div class="clear-pm">
                                            <img src="http://www.creatifprint.com/wp-content/uploads/2013/11/logo-bank-mandiri.jpg" alt="" width="80">
                                            <div>
                                                <b>
                                                    080 989 4444<br>
                                                    a.n. PT Laris Banget Nich
                                                </b>
                                            </div>
                                        </div>
                                    </li>
                                </ol>
                            </div>
                            <div class="grid-flex__col grid-flex__col--6">
                                <center class="darkgreen"><h3>Top Up Form</h3></center>
                                <form action="" class="wallet-form">
                                    <div class="form-row">
                                        <label for="nama">Nama: </label>
                                        <input type="text" name="name" placeholder="nama pemilik">
                                    </div>
                                    <div class="form-row">
                                        <label for="amount">Jumlah: </label>
                                        <input type="number" name="amount" placeholder="jumlah top up">
                                    </div>
                                    <div class="form-row">
                                        <label for="bank">Bank: </label>
                                        <select name="bank" id="">
                                            <option value="">-- Nama Bank --</option>
                                            <option value="">Bank Toyib</option>
                                            <option value="">Bank Rupt</option>
                                        </select>
                                    </div>
                                    <br>
                                    <center><button type="submit" class="btn btn-green">Bayar</button></center>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>  

<?php include '_footer.php' ?>