<?php
  include('menu.inc.php');
  if(isset($_POST['submit'])){    
    $cityName = get_safe_value($conn,$_POST['city']);
    echo "<h1>$cityName</h1>";
    $insert_sql = "INSERT INTO `cities` (`Name`, `status`) VALUES ('$cityName', '1')";
    mysqli_query($conn,$insert_sql);
  }
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
    if($type == 'edit')
    {    
      $statusID = get_safe_value($conn,$_GET['id']);
      $update_city_sql = "update from cities where id = '$statusID'";
      mysqli_query($conn,$delete_sql);
    }
  }

  $sql = 'SELECT * FROM cities ORDER BY `Name`';
  $res = mysqli_query($conn, $sql);
?>
<main id="main" class="main">
  <div class="pagetitle">
    <h1>Manage City</h1>
    <nav>
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="dashboard.php">Admin</a></li>
        <li class="breadcrumb-item">Manage Cities</li>
      </ol>
    </nav>
  </div><!-- End Page Title -->
  <section class="section">
    <div class="row">
      <div class="col-lg-6">
        <div class="card">
          <div class="card-body">
            <h5 class="card-title">Manage Cities</h5>
            <!-- Browser Default Validation -->
            <form class="row g-3" method="post">
              <div class="col-sm">
                <label for="cities" class="form-label">City Name</label>
                <input type="text" class="form-control" id="cities" name="city" value="<?php if()?>" placeholder="type City's name here" required>
              </div>
              <div class="col-12">
                <button class="btn btn-primary" type="submit" name="submit">Save</button>
              </div>
            </form>
            <!-- End Browser Default Validation -->
          </div>
        </div>
      </div>
    </div>
  </section>
  <section class="section">
    <div class="row">
      <div class="col-lg-12">
        <div class="card">
          <div class="card-body">
            <h5 class="card-title">All cities</h5>
            <!-- Table with stripped rows -->
            <table class="table datatable">
              <thead>
                <tr>
                  <th scope="col">#</th>
                  <th scope="col">ID</th>
                  <th scope="col">cities</th>
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
                      if ($rows['status'] == 1) {
                        echo "<a href='?type=status&op=deactive&id=" . $rows['id'] . "'>Active</a>";
                      } else {
                        echo "<a href='?type=status&op=active&id=" . $rows['id'] . "'>Deactive</a>";
                      }
                      echo "<a href='?type=delete&id=" . $rows['id'] . "'>, Delete</a>";
                      echo "<a href='?type=edit&id=" . $rows['id'] . "'>, Edit</a>";
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
</main>
<?php
include('footer.inc.php');
?>