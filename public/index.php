<?php
include('includes/config.php');
?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Home</title>
  
  <link href="css/style.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

</head>

<body style="background-color: #F8F8F8;">
  <?php include_once('includes/header.php'); ?>

  <div class="row page-container">
    <div class="col-sm-1">
      <?php include_once('includes/sidebar.php'); ?>

    </div>
    <div class="container">
      <div class="row">
        <div class="col">
          <!-- content of page -->
          <form class="form-inline">
            <div class="form-group">
              <label>From</label>
              <input type="date" value="<?php echo date('Y-m-d'); ?>" class="mx-sm-3">
              <label>To</label>
              <input type="date" value="<?php echo date('Y-m-d', strtotime('tomorrow')); ?>" class="mx-sm-3">
              <label>Day</label>
              <div class="mx-sm-3">
                <select name="location" required class="form-control" style="border-radius:20px;width:20rem;">
                  <option selected value="sun">Sunday</option>
                  <option value="mon">Monday</option>
                  <option value="tue">Tuesday</option>
                  <option value="wed">Wednesday</option>
                  <option value="thu">Thursday</option>
                  <option value="fri">Friday</option>
                  <option value="sat">Saturday</option>
                </select>
              </div>
              <div class="mx-sm-2">
                <input type="submit" value="Generate" name="submit" class="btn" style="border-radius: 20px; background-color:#1E22A1;color:white">
              </div>
              <div class="mx-sm-5">
                <input type="submit" value="Export" name="export" class="btn" style="border-radius: 20px; background-color:#FF8316;color:white">
              </div>

            </div>
          </form>
        </div>
      </div>
      <br>
      <div class="row">
        <table class="table table-borderless">
          <thead>
            <tr>
              <th scope="col">Product Name</th>
              <th scope="col">Product Price</th>
              <th scope="col">Times been ordered</th>
              <th scope="col">Merchant Name</th>
            </tr>
          </thead>
          <tbody style="color:rgb(92, 91, 91);">
            <?php $sql = "SELECT * from products";
            $query = $dbh->prepare($sql);
            $query->execute();
            $results = $query->fetchAll(PDO::FETCH_OBJ);
            if ($query->rowCount() > 0) {
              foreach ($results as $result) {        
              $sql = "SELECT * from merchants where id=($result->id)";
                                $query = $dbh->prepare($sql);
                                $query->execute();
                                $results = $query->fetchAll(PDO::FETCH_OBJ);
                                foreach ($results as $result2) { ?>
                
              
                <tr>
                  <td><?php echo htmlentities($result->name); ?></td>
                  <td><?php echo htmlentities($result->price);  ?> $</td>
                  <td><?php
                      $originalDate = $result->created_at;
                      $newDate = date("d/m/Y", strtotime($originalDate));
                      echo $newDate; ?></td>
                  <td><?php echo htmlentities($result2->merchant_name); ?></td>
                </tr>
            <?php }}
            } ?>
          </tbody>
        </table>
      </div>
    </div>
  </div>
  </div>

  </div>
  <?php include_once('includes/footer.php'); ?>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>

</html>