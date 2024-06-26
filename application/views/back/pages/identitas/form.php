<div class="container">
	<div class="row mb-4">
		<div class="col">
			<h3>Form Update Profile Website</h3>
		</div>
	</div>

	<?= form_open_multipart($form_action) ?>
		<?= isset($content->id) ? form_hidden('id', $content->id) : '' ?>

		<div class="form-group row">
			<label for="meta_isi" class="col-sm-2 col-form-label">Isi</label>
			<div class="col-sm-8">
				<textarea name="meta_isi" id="meta_isi" rows="5" class="form-control" value="<?= $content->meta_isi ?>"><?= $content->meta_isi ?></textarea>
				<?= form_error('meta_isi', '<small class="form-text text-danger">', '</small>') ?>
			</div>
		</div>

		<div class="form-group row">
			<label for="meta_judul" class="col-sm-2 col-form-label">Judul</label>
			<div class="col-sm-8">
				<textarea name="meta_judul" id="meta_judul" rows="5" class="form-control" value="<?= $content->meta_judul ?>"><?= $content->meta_judul ?></textarea>
				<?= form_error('meta_judul', '<small class="form-text text-danger">', '</small>') ?>
			</div>
		</div>

		<!-- <div class="form-group row">
			<label class="col-sm-2 col-form-label" id="label-photo">Foto</label>
			<div class="col-sm-8">
				<?php if(!empty($content->photo)) : ?>
					<img src="<?= base_url("img/identitas/$content->photo") ?>" alt="" height="150">
				<?php else: ?>
					<p>No Photo</p>
				<?php endif; ?>
				<br> 
				<small><span class="text-danger">*</span>	Maksimal ukuran gambar adalah 1 MB</small>
				<br> <br>
				<input name="photo" type="file" class="form-control-file">
				<?php if($this->session->flashdata('image_error')) :  ?>
                <small class="form-text text-danger">
                  <?= $this->session->flashdata('image_error') ?>
                </small>
				<?php endif ?>
			</div>
		</div> -->

		<div class="row mt-4">
			<div class="col-8 offset-2">
				<a href="<?= base_url('index.php/identitas') ?>" class="btn btn-sm btn-secondary"><i class="fas fa-angle-left mr-1"></i>Kembali</a>
				<button type="submit" class="btn btn-sm btn-primary float-right"><i class="fas fa-check mr-1"></i> Simpan</button>
			</div>
		</div>
	<?= form_close() ?>
</div>
