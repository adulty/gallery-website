<script type="text/javascript">

   let tableForkin;

   // Show Table
   $(document).ready(function() {

      tableForkin = $('#tableForkin').DataTable({
         ajax: '../server_side/scripts/server_processing.php',
         processing: true,
         serverSide: true,
         order: [4, 'desc'],
         ajax: {
            'url': "<?= base_url('index.php/forkin/ajax_list') ?>",
            'type': "POST"
         },
         columnDefs: [{
               'targets': [0, 2, -1],
               'orderable': false,
            },
            {
               'width': '10%',
               'targets': -1
            }
         ],
         lengthMenu: [5, 10, 20, 50, 100]
      });
   });

   // Reload Table
   function reload_table() {
      tableForkin.ajax.reload(null, false);
   }

   // Delete Menu
   function delete_forkin(id) {
      Swal.fire({
         title: 'Hapus Data Informasi Terkini ini ?',
         icon: 'warning',
         showCancelButton: true,
         confirmButtonColor: '#3085d6',
         cancelButtonColor: '#d33',
         confirmButtonText: 'Hapus!'
      }).then((result) => {
         if (result.value) {
            $.ajax({
               type: 'post',
               dataType: 'json',
               url: '<?= base_url('index.php/forkin/delete'); ?>',
               data: {
                  id: id
               },
               success: function(data) {
                  if (data.status) {
                     tableForkin.row($(this).parents('tr')).remove().draw();
                     Swal.fire({
                        icon: 'success',
                        title: 'Success',
                        showConfirmButton: true
                     });
                  }
               },
               error: function() {
                  Swal.fire({
                     icon: 'error',
                     title: 'Oops...',
                     text: 'Terjadi Suatu Kesalahan!',
                     showConfirmButton: true
                  });
               }
            });
         }
      });
   }
</script>