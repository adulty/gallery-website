<div class="container">
	<div class="row mb-4">
		<div class="col">
			<h3>Form Update Galery Sekolah</h3>
		</div>
	</div>

	<?= form_open_multipart($form_action) ?>
	<?= isset($content->id) ? form_hidden('id', $content->id) : '' ?>

	<div class="form-group row">
		<label for="judul" class="col-sm-2 col-form-label">Judul</label>
		<div class="col-sm-8">
			<input type="text" name="judul" id="judul" class="form-control" value="<?= $content->judul ?>">
			<?= form_error('content', '<small class="form-text text-danger">', '</small>') ?>
		</div>
	</div>

	<div class="form-group row">
		<label for="galery" class="col-sm-2 col-form-label">Galery Sekolah</label>
		<div class="col-sm-8">
			<textarea name="content" id="galery" rows="5" class="form-control" value="<?= $content->content ?>"><?= $content->content ?></textarea>
			<?= form_error('content', '<small class="form-text text-danger">', '</small>') ?>
		</div>
	</div>

	<div class="form-group row">
		<label class="col-sm-2 col-form-label" id="label-photo">Foto</label>
		<div class="col-sm-8">
			<?php if (!empty($content->photo)) : ?>
				<img src="<?= base_url("index.php/img/galerysekolah/$content->photo") ?>" alt="" height="300">
			<?php else : ?>
				<p>No Photo</p>
			<?php endif; ?>
			<br>
			<small><span class="text-danger">*</span> Maksimal ukuran gambar adalah 3 MB</small>
			<br> <br>
			<input name="photo" type="file" class="form-control-file" multiple>
			<?php if ($this->session->flashdata('image_error')) :  ?>
				<small class="form-text text-danger">
					<?= $this->session->flashdata('image_error') ?>
				</small>
			<?php endif ?>
		</div>
	</div>

	<div class="row mt-4">
		<div class="col-8 offset-2">
			<a href="<?= base_url('index.php/galery') ?>" class="btn btn-sm btn-secondary"><i class="fas fa-angle-left mr-1"></i>Kembali</a>
			<button type="submit" class="btn btn-sm btn-primary float-right"><i class="fas fa-check mr-1"></i> Simpan</button>
		</div>
	</div>
	<?= form_close() ?>
</div>