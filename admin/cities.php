<?php
include('menu.inc.php');
if(isset($_GET['type']) && $_GET['type'] != ''){
  $type = get_safe_value($conn,$_GET['type']);
  if($type == 'status')
  {
    $op = get_safe_value($conn,$_GET['op']);
    $statusID = get_safe_value($conn,$_GET['id']);    
    if($op == 'active'){
      $status = 1;
    }else{
      $status = 0;
    }
    $update_status_sql = "update cities set status = '$status' where id = '$statusID'";
    mysqli_query($conn,$update_status_sql);
  }
  if($type == 'delete')
  {    
    $statusID = get_safe_value($conn,$_GET['id']);
    $delete_sql = "delete from cities where id = '$statusID'";
    mysqli_query($conn,$delete_sql);
  }
}
$sql = 'SELECT * FROM cities ORDER BY `Name`';
$res = mysqli_query($conn, $sql);
?>
<main id="main" class="main">
  <div class="pagetitle">
    <h1>cities</h1>
    <nav>
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="login.php">Admin</a></li>
        <li class="breadcrumb-item"><a href="dashboard.php">Dashboard</li>
        <li class="breadcrumb-item">Cities</li>
      </ol>
    </nav>
  </div><!-- End Page Title -->
  <section class="section">
    <div class="row">
      <div class="col-lg-12">
        <div class="card">
          <div class="card-body">
            <div class="row">
              <div class="col">
                <h5 class="card-title">All Cities</h5>
              </div>
              <div class="col text-end">
                <a href="manage_cities.php" type="button" class="btn btn-sm btn-primary mt-3">+ Add City</a>
              </div>
            </div>
            <!-- <p>Add lightweight datatables to your project with using the <a href="https://github.com/fiduswriter/Simple-DataTables" target="_blank">Simple DataTables</a> library. Just add <code>.datatable</code> class name to any table you wish to conver to a datatable</p> -->

            <!-- Table with stripped rows -->
            <table class="table datatable">
              <thead>
                <tr>
                  <th scope="col">#</th>
                  <th scope="col">ID</th>
                  <th scope="col">Cities</th>
                  <th scope="col">Status</th>
                </tr>
              </thead>
              <tbody>
                <?php
                $srno = 1;
                while ($rows = mysqli_fetch_assoc($res)) {
                ?>
                  <tr>
                    <td><?php echo $srno; ?></td>
                    <td><?php echo $rows['id']; ?></td>
                    <td><?php echo $rows['Name']; ?></td>                    
                    <td>
                      <?php 
                        if($rows['status'] == 1){
                          echo "<a href='?type=status&op=deactive&id=".$rows['id']."'>Active</a>";
                        }else{
                          echo "<a href='?type=status&op=active&id=".$rows['id']."'>Deactive</a>";
                        }
                        echo "<a href='?type=delete&id=".$rows['id']."'>, Delete</a>";
                      ?>
                    </td>
                  </tr>
                <?php $srno++;
                } ?>
              </tbody>
            </table>
            <!-- End Table with stripped rows -->
          </div>
        </div>
      </div>
    </div>
  </section>
</main><!-- End #main -->
<?php 
  include('footer.inc.php'); 
?>