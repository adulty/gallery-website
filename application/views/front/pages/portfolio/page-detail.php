<div class="blog mt-5 mb-5">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-10">
				<h1 class="text-center"><?= $portfolio->title ?></h1>
			</div>
		</div>

		<div class="row justify-content-center mt-4">
			<div class="col-lg-10">
				<p class="text-right text-muted"><i class="fa fa-calendar-alt mr-2" aria-hidden="true"></i><?= mediumdate_indo($portfolio->date) ?></p>
				<img src="<?= base_url('img/portfolio/' . $portfolio->photo) ?>">
			</div>
		</div>

		<div class="row justify-content-center mt-4 konten">
			<div class="col-lg-10">
				<?= $portfolio->content ?>
			</div>
		</div>
	</div>
</div>
