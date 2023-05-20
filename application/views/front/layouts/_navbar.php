<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container">
		<a class="navbar-brand" href="<?= base_url() ?>">
			<img style="max-width:250px;" src="<?= base_url('img/identitas/logotefa.png') ?>">
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item <?php if($title == 'Beranda') echo "active"; ?>">
				<a class="nav-link" href="<?= base_url() ?>">Beranda</a>
				</li>
				<li class="nav-item dropdown <?php if($title == 'Deskripsi TEFA' || $title == 'Visi & Misi' || $title == 'Struktur' || $title == 'Hubungan Industri') echo "active"; ?>">
				<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					Profil
				</a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					<a class="dropdown-item" href="<?= base_url('index.php/profil/deskripsi') ?>">Deskripsi TEFA</a>
					<a class="dropdown-item" href="<?= base_url('index.php/profil/visimisi') ?>">Visi & Misi</a>
					<a class="dropdown-item" href="<?= base_url('profil/struktur') ?>">Struktur TEFA</a>
					<a class="dropdown-item" href="<?= base_url('index.php/profil/hubin') ?>">Hubungan Industri</a>
				</div>
				</li>
				<li class="nav-item dropdown <?php if($title == 'Perancangan & Pembuatan Website' || $title == 'Photobooth' || $title == 'Instalasi CCTV & LAN') echo "active"; ?>">
				<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					Produk
				</a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					<a class="dropdown-item" href="<?= base_url('index.php/produk/ppw') ?>">Perancangan & Pembuatan Website</a>
					<a class="dropdown-item" href="<?= base_url('index.php/produk/pb') ?>">Photobooth</a>
					<a class="dropdown-item" href="<?= base_url('index.php/produk/icl') ?>">Instalasi CCTV & LAN</a>
				</div>
				</li>
				</li>
				<li class="nav-item <?php if($title == 'Portfolio') echo "active"; ?>">
				<a class="nav-link" href="<?= base_url('index.php/page') ?>">Portfolio</a>
				</li>
				<li class="nav-item <?php if($title == 'Berita') echo "active"; ?>">
				<a class="nav-link" href="<?= base_url('index.php/blog') ?>">Berita</a>
			</ul>
		</div>
	</div>
</nav>
