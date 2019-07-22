<?php include("includes/header.php");

$file_path = 'http://'.$_SERVER['SERVER_NAME'] . dirname($_SERVER['REQUEST_URI']).'/api.php';
?>
<div class="row">
      <div class="col-sm-12 col-xs-12">
     	 	<div class="card">
		        <div class="card-header">
		          Example API urls
		        </div>
       			    <div class="card-body no-padding">
         		
         			 <pre><code class="html">
                <br><b>API URL</b> <?php echo $file_path;?>

                <br><b>Home</b> (Method: get_home)
                <br><b>Latest Recipe</b> (Method: get_latest)
                <br><b>Popular Recipe</b> (Method: get_popular_recipe)
                <br><b>Category List</b> (Method: cat_list)
                <br><b>Sub Category list by Cat ID</b> (Method: get_sub_cat)(Parameter: cat_id)
                <br><b>Recipe list by Sub Cat ID</b> (Method: get_recipe_by_sub_cat)(Parameter: sub_cat_id)
                <br><b>Single Recipe</b> (Method: get_single_recipe)(Parameter: recipe_id)
                <br><b>Search Recipe</b> (Method: get_search_recipe)(Parameter: search_text)
                <br><b>User Register</b>(Method: user_register)(Parameter:name,email,password,phone)
                <br><b>User Login</b>(Method: user_login)(Parameter:email,password)
                <br><b>User Profile</b>(Method: user_profile)(Parameter:user_id)
                <br><b>User Profile Update</b>(Method: user_profile_update)(Parameter:user_id,name,email,password,phone)
                <br><b>Forgot Password</b>(Method: forgot_pass)(Parameter:user_email)
                <br><b>Rating</b>(Method: recipe_rate)(Parameter:device_id,post_id,user_id,rate,message)
                <br><b>App Details</b>(Method: get_app_details)
                </code></pre>
       		
       				</div>
          	</div>
        </div>
</div>
    <br/>
    <div class="clearfix"></div>
        
<?php include("includes/footer.php");?>       
