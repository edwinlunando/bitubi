<?php include '_header.php' ?>
<?php include '_menu.php' ?>

    <div class="wrapper">
    <!-- ====================== Top Banner ===================== -->
        <div class="top-banner">
            <img class="lazy" data-original="assets/img/bg-top-banner.jpg" alt="">
            <!-- <img src="assets/img/bg-top-banner.jpg" alt=""> -->
            <div class="top-banner--content">
                <h1 class="top-banner--title">Food and Stuffs</h1>
                <p>
                   We have foods and equipments for your companion
                </p>
            </div>
        </div>
    <!-- ===================== FILTER & SORT ===================== -->
        <div class="grid-flex--no-pad page-breadcrumb--container">
            <div class="grid-flex--no-gutter grid-flex__col--12">
                <ul class="breadcrumb">
                    <li><a href="">Home</a></li>
                    <li><a href="">Foods and Equipments</a></li>
                </ul>
            </div>
        </div>
    <!-- ===================== FILTER & SORT ===================== -->
        <div class="grid-flex--no-pad filter-container">
            <div class="grid-flex--no-gutter grid-flex__col--6 filter-type-container">
                <div class="grid-flex--no-pad ">
                    <div class="grid-flex--no-gutter grid-flex__col--4 filter-type-name">
                        Sort By:
                    </div>
                    <div class="grid-flex--no-gutter grid-flex__col--8">
                        <ul class="breadcrumb">
                            <li class="active"><a href="">Terbaru</a></li>
                            <li><a href="">Termurah</a></li>
                            <li><a href="">Termahal</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="grid-flex--no-gutter grid-flex__col--6 filter-type-container">
                <div class="grid-flex--no-pad ">
                    <div class="grid-flex--no-gutter grid-flex__col--4 filter-type-name">
                        Search Category:  
                    </div>
                    <div class="grid-flex--no-gutter grid-flex__col--8">
                        <form action="" class="form__row form-filter--left">
                            <select name="type" class="form-select">
                                <option value="1" selected>Makanan</option>
                                <option value="2">Aksesoris</option>
                                <option value="3">Peralatan dan Mainan</option>
                            </select>
                            <button type="submit" class="form-submit-search"><i class="fa fa-search"></i></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    <!-- =================== Gridding System =================== -->
        <div class="container">
    <!-- ================ Caption Hover Style # ================ -->
            <div class="grid-flex">
                <div class="grid-flex__col grid-flex__col--12">
                    <div class="category-title">
                        <h2 class="category-title__title">New Arrivals</h2>
                        <p class="category-title__description">
                            This season we continue to keep our promise of bringing you the latest from our world of furry friends. Please look at them.
                        </p>
                    </div>
                    <ul class="caption-square">
                        <li>
                            <a href="##">
                                <figure>
                                        <div class="caption-square__img-wrap">
                                            <img class="lazy" data-original="assets/img/caption-img.jpg" alt="">
                                        </div>
                                        <figcaption>
                                            <div class="caption-square-category">Dog</div>
                                            <p class="caption-square-title">Lorem Ipsum Dolor Sit Amet Consectetur Sto</p>
                                            <p class="caption-square-price">5000000</p>
                                        </figcaption>
                                </figure>
                            </a>
                            <div class="caption-square__cta">
                                <a href="#" class="caption-square__fav"><i class="fa fa-heart-o fa-lg"></i> </a>
                                <a href="#" class="caption-square__bid"><i class="fa fa-money fa-lg"></i></a>
                            </div>
                        </li>
                        <li>
                            <a href="##">
                                <figure>
                                        <div class="caption-square__img-wrap">
                                            <img class="lazy" data-original="assets/img/caption-img.jpg" alt="">
                                        </div>
                                        <figcaption>
                                            <div class="caption-square-category">Dog</div>
                                            <p class="caption-square-title">Lorem Ipsum Dolor Sit Amet Consectetur Sto</p>
                                            <p class="caption-square-price">5000000</p>
                                        </figcaption>
                                </figure>
                            </a>
                            <div class="caption-square__cta">
                                <a href="#" class="caption-square__fav"><i class="fa fa-heart-o fa-lg"></i> </a>
                                <a href="#" class="caption-square__bid"><i class="fa fa-money fa-lg"></i></a>
                            </div>
                        </li>
                        <li>
                            <a href="##">
                                <figure>
                                        <div class="caption-square__img-wrap">
                                            <img class="lazy" data-original="assets/img/caption-img.jpg" alt="">
                                        </div>
                                        <figcaption>
                                            <div class="caption-square-category">Dog</div>
                                            <p class="caption-square-title">Lorem Ipsum Dolor Sit Amet Consectetur Sto</p>
                                            <p class="caption-square-price">5000000</p>
                                        </figcaption>
                                </figure>
                            </a>
                            <div class="caption-square__cta">
                                <a href="#" class="caption-square__fav"><i class="fa fa-heart-o fa-lg"></i> </a>
                                <a href="#" class="caption-square__bid"><i class="fa fa-money fa-lg"></i></a>
                            </div>
                        </li>
                        <li>
                            <a href="##">
                                <figure>
                                        <div class="caption-square__img-wrap">
                                            <img class="lazy" data-original="assets/img/caption-img.jpg" alt="">
                                        </div>
                                        <figcaption>
                                            <div class="caption-square-category">Dog</div>
                                            <p class="caption-square-title">Lorem Ipsum Dolor Sit Amet Consectetur Sto</p>
                                            <p class="caption-square-price">5000000</p>
                                        </figcaption>
                                </figure>
                            </a>
                            <div class="caption-square__cta">
                                <a href="#" class="caption-square__fav"><i class="fa fa-heart-o fa-lg"></i> </a>
                                <a href="#" class="caption-square__bid"><i class="fa fa-money fa-lg"></i></a>
                            </div>
                        </li>   
                    </ul>
                </div>
            </div>
    <!-- ================= End of Main Content ================= -->
        </div>
    </div>  

<?php include '_footer.php' ?>