<section class="content-header">
      <h1>
       Suppliers
        <small>Pemasok Barang</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i></a></li>
        <li class="active">Users</li>
      </ol>
</section>

   
<section class="content">
  <div class="box">
    <div class="box-header">
        <h3 class="box-title">Data Suppliers</h3>
        <div class="pull-right">
          <a href="<?=site_url('supplier/add')?>" class="btn btn-primary btn-flat">
            <i class="fa fa-plus"></i> Create
          </a>
        </div>
    </div>
    <div class="box-body table-responsive">
      <table class="table table-bordered table-striped" id="table1">
        <thead>
          <tr>
            <th>#</th>
            <th>Name</th>
            <th>Phone</th>
            <th>Address</th>
            <th>Description</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          <?php $no = 1;
          foreach($row->result() as $key => $data) { ?>
          <tr>
            <td width="5%;"><?=$no++?>.</td>
            <td><?=$data->name?></td>
            <td><?=$data->phone?></td>
            <td><?=$data->address?></td>
            <td><?=$data->description?></td>
            <td class="text-center" width="160px">
              <a href="<?=site_url('supplier/edit/'.$data->supplier_id)?>"  class="btn btn-primary btn-xs">
                <i class="fa fa-pencil"></i> Update
              </a>
              <!-- <a href="<?=site_url('supplier/del/'.$data->supplier_id)?>" onclick="return confirm('Yakin hapus data?')" class="btn btn-danger btn-xs">
                <i class="fa fa-trash"></i> Delete
              </a> -->
              <a href="#modalDelete" data-toggle="modal" onclick="$('#modalDelete #formDelete').attr('action', '<?=site_url('supplier/del/'.$data->supplier_id)?>')" class="btn btn-danger btn-xs">
                <i class="fa fa-trash"></i> Delete
              </a>
            </td>
          </tr>
          <?php
        } ?>
        </tbody>
      </table>
    </div>

  </div>
  <div class="modal fade" id="modalDelete">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <h4 class="modal-title">Yakin mau dihapus data ini</h4>
      </div>
      <div class="modal-footer">
        <form id="formDelete" action="" method="post">
          <button class="btn btn-default" data-dismiss="modal">Tidak</button>
          <button class="btn btn-danger" type="submit">Hapus</button>
        </form>
    </div>
  </div>
</div>
</section>
