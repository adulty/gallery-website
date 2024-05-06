<!-- Carousel -->
<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
	<div class="carousel-inner">
		<?php $no = 0; ?>
		<?php foreach ($banners as $banner) : ?>
			<?php $no++;  ?>
			<div class="carousel-item <?php if ($no <= 1) {
											echo "active";
										} ?>">
				<img src="<?= base_url("img/banner/$banner->photo") ?>" class="d-block w-100">

			</div>
		<?php endforeach ?>
	</div>
	<a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
		<span class="carousel-control-prev-icon" aria-hidden="true"></span>
		<span class="sr-only">Previous</span>
	</a>
	<a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
		<span class="carousel-control-next-icon" aria-hidden="true"></span>
		<span class="sr-only">Next</span>
	</a>
</div>
<!-- End of Carousel -->

<!-- Sambutan -->
<div class="sambutan mt-4">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-6 col-md-4 col-sm-6 col-xs-7 text-center">
				<img src="<?= base_url('img/galerysekolah/' . $galerysekolah->photo) ?>" class="img-fluid">
			</div>
			<div class="col-lg-6 col-md-8 col-sm-12 col-xs-12">
				<h2>Gallery Kegiatan Sekolah</h2>
				<hr>
				<h5 class="card-title" style="text-align: center; font-size: 25px; font-weight:bold;"><?= $galerysekolah->judul ?></h5>
				<p class="text-center"><?= $galerysekolah->content ?></p>
			</div>
		</div>
	</div>
</div>
<!-- End of Sambutan -->


<!-- Berita -->
<div class="last-news mt-5 mb-5">
	<div class="container">
		<div class="row d-flex justify-content-center">
			<div class="col">
			</div>
		</div>
		<div class="row mt-2">
			<div class="col-lg-6 col-md-4 col-sm-6 col-xs-7 text-center">
				<h2 class="text-center">Agenda Sekolah</h2>
				<div class="container mt-5">
					<ul>
						<li>Melaksanakan uji kompetensi</li>
						<li>Melaksanakan PKL bagi siswa-siswi</li>
						<li>Study Tour Dieng-Yogyakarta</li>
						<li>Ujian Semester Akhir bagi murid XII</li>
						<li>Pelatihan Robotik oleh mahasiswa UNHAN RI</li>
						<li>Melakukan Team Kelompok Bisnis PKK</li>
						<li>Melaksanakan Tugas Tarian Daerah SBK</li>
					</ul>
				</div>
			</div>
			<?php foreach ($forkin as $f) : ?>
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<h2 class="text-center">Informasi Terkini</h2>
					<h5 class="card-title" style="text-align: center;"><?= $f->title ?></h5>
					<img style="height:250px width:250px" src="<?= base_url('img/informasiterkini/' . $f->photo) ?>" class="card-img-top">
					<div class="card-body">
						<p class="card-text"><?= character_limiter($f->content, 200) ?></p>
					</div>
				</div>
			<?php endforeach ?>
		</div>
	</div>
</div>
<!-- End of Berita -->