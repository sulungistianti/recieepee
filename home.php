<?php include("includes/header.php");

$qry_cat="SELECT COUNT(*) as num FROM tbl_category";
$total_category= mysqli_fetch_array(mysqli_query($mysqli,$qry_cat));
$total_category = $total_category['num'];

$qry_recipe="SELECT COUNT(*) as num FROM tbl_recipe";
$total_recipe = mysqli_fetch_array(mysqli_query($mysqli,$qry_recipe));
$total_recipe = $total_recipe['num'];

$qry_sub_cat="SELECT COUNT(*) as num FROM tbl_sub_category";
$total_sub_category= mysqli_fetch_array(mysqli_query($mysqli,$qry_sub_cat));
$total_sub_category = $total_sub_category['num'];

$qry_users="SELECT COUNT(*) as num FROM tbl_users";
$total_users = mysqli_fetch_array(mysqli_query($mysqli,$qry_users));
$total_users = $total_users['num'];


 

?>       


        <div class="btn-floating" id="help-actions">
      <div class="btn-bg"></div>
      <button type="button" class="btn btn-default btn-toggle" data-toggle="toggle" data-target="#help-actions"> <i class="icon fa fa-plus"></i> <span class="help-text">Shortcut</span> </button>
      <div class="toggle-content">
        <ul class="actions">
          <li><a href="http://www.viaviweb.com" target="_blank">Website</a></li>
           <li><a href="https://codecanyon.net/user/viaviwebtech?ref=viaviwebtech" target="_blank">About</a></li>
        </ul>
      </div>
    </div>
    <div class="row">
      <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12"> <a href="manage_category.php" class="card card-banner card-green-light">
        <div class="card-body"> <i class="icon fa fa-sitemap fa-4x"></i>
          <div class="content">
            <div class="title">Categories</div>
            <div class="value"><span class="sign"></span><?php echo $total_category;?></div>
          </div>
        </div>
        </a> 
        </div>
		  <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12"> <a href="manage_sub_category.php" class="card card-banner card-yellow-light">
        <div class="card-body"> <i class="icon fa fa-sitemap fa-4x"></i>
          <div class="content">
            <div class="title">Sub Cat</div>
            <div class="value"><span class="sign"></span><?php echo $total_sub_category;?></div>
          </div>
        </div>
        </a> 
        </div>
        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12"> <a href="manage_recipe.php" class="card card-banner card-yellow-light">
        <div class="card-body"> <i class="icon fa fa-coffee"></i>
          <div class="content">
            <div class="title">Recipe</div>
            <div class="value"><span class="sign"></span><?php echo $total_recipe;?></div>
          </div>
        </div>
        </a> 
        </div>
         
      <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12"> <a href="manage_users.php" class="card card-banner card-blue-light">
        <div class="card-body"> <i class="icon fa fa-users fa-4x"></i>
          <div class="content">
            <div class="title">Users</div>
            <div class="value"><span class="sign"></span><?php echo $total_users;?></div>
          </div>
        </div>
        </a> </div>

    </div>

        
<?php include("includes/footer.php");?>       
