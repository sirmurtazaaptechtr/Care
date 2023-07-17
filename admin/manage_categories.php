<?php
  include('menu.inc.php');

  $sql = 'SELECT * FROM categories ORDER BY `categories`';
  $res = mysqli_query($conn, $sql);
?>
<main id="main" class="main">
  <div class="pagetitle">
    <h1>Manage Category</h1>
    <nav>
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.html">Admin</a></li>
        <li class="breadcrumb-item">Manage Category</li>
      </ol>
    </nav>
  </div><!-- End Page Title -->
  <section class="section">
    <div class="row">
      <div class="col-lg-6">
        <div class="card">
          <div class="card-body">
            <h5 class="card-title">Manage Category</h5>
            <!-- Browser Default Validation -->
            <form class="row g-3" method="post">
              <div class="col-sm">
                <label for="categories" class="form-label">Category Name</label>
                <input type="text" class="form-control" id="categories" name="category" placeholder="type category's name here" required>
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
            <h5 class="card-title">All Categories</h5>
            <!-- Table with stripped rows -->
            <table class="table datatable">
              <thead>
                <tr>
                  <th scope="col">#</th>
                  <th scope="col">ID</th>
                  <th scope="col">Categories</th>
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
                    <td><?php echo $rows['categories']; ?></td>
                    <td>
                      <?php
                      if ($rows['status'] == 1) {
                        echo "<a href='?type=status&op=deactive&id=" . $rows['id'] . "'>Active</a>";
                      } else {
                        echo "<a href='?type=status&op=active&id=" . $rows['id'] . "'>Deactive</a>";
                      }
                      echo "<a href='?type=delete&id=" . $rows['id'] . "'>, Delete</a>";
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