<div class="container">
   <div class="row">
      <div class="col">
         <h2>Data Informasi Terkini</h2>
      </div>
   </div>

   <div class="row">
      <div class="col">
         <?php if ($this->session->flashdata('success')) : ?>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
               <?= $this->session->flashdata('success') ?>
               <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>
            </div>
         <?php elseif ($this->session->flashdata('error')) : ?>
            <div class="alert alert-error alert-dismissible fade show" role="alert">
               <?= $this->session->flashdata('error') ?>.
               <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>
            </div>
         <?php endif ?>
      </div>
   </div>

   <div class="row mt-3">
      <div class="col">
         <a href="<?= base_url('index.php/forkin/add') ?>" class="btn btn-success btn-sm">
            <i class="fas fa-plus"></i> Tambah
         </a>

         <button class="btn btn-outline-secondary btn-sm" onclick="reload_table()">
            <i class="fas fa-sync-alt"></i> Reload
         </button>
      </div>
   </div>

   <div class="table-responsive mt-3">
      <table id="tableForkin" class="table table-striped table-bordered" cellspacing="0" width="100%" class="display">
         <thead>
            <tr>
               <th>#</th>
               <th>Judul</th>
               <!-- <th>Content</th> -->
               <th>Foto</th>
               <th>Aktif</th>
               <th>Diupload</th>
               <th>Aksi</th>
            </tr>
         </thead>
         <tbody>

         </tbody>
      </table>
   </div>

</div>