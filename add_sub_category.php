<?php include("includes/header.php");

	require("includes/function.php");
	require("language/language.php");

	require_once("thumbnail_images.class.php");

	$cat_qry="SELECT * FROM tbl_category ORDER BY category_name";
	$cat_result=mysqli_query($mysqli,$cat_qry);  
	
	if(isset($_POST['submit']) and isset($_GET['add']))
	{
	   

    if($_FILES['sub_cat_image']['name']!="")
    {

	   $sub_cat_image=rand(0,99999)."_".$_FILES['sub_cat_image']['name'];
		 $pic1=$_FILES['sub_cat_image']['tmp_name'];	 
       //Main Image
	   $tpath1='images/'.$sub_cat_image; 
     copy($pic1,$tpath1);
		  
       $data = array( 
			   'cat_id'  =>  $_POST['cat_id'],
			   'sub_cat_name'  =>  $_POST['sub_cat_name'],
			   'sub_cat_image'  =>  $sub_cat_image
			    );		

 		 }
     

    $qry = Insert('tbl_sub_category',$data);	

 
 	   
		$_SESSION['msg']="10";
 
		header( "Location:manage_sub_category.php");
		exit;	
		 
		
	}
	
	if(isset($_GET['sub_cat_id']))
	{
			 
			$qry="SELECT * FROM tbl_sub_category where sid='".$_GET['sub_cat_id']."'";
			$result=mysqli_query($mysqli,$qry);
			$row=mysqli_fetch_assoc($result);

	}
	if(isset($_POST['submit']) and isset($_POST['sub_cat_id']))
	{
		 
		 if($_FILES['sub_cat_image']['name']!="")
		 {		

				$img_res=mysqli_query($mysqli,'SELECT * FROM tbl_sub_category WHERE sid='.$_GET['sub_cat_id'].'');
			    $img_res_row=mysqli_fetch_assoc($img_res);
			

			    if($img_res_row['sub_cat_image']!="")
		        {
 					    unlink('images/'.$img_res_row['sub_cat_image']);
			     }

 				 $sub_cat_image=rand(0,99999)."_".$_FILES['sub_cat_image']['name'];
		 	     $pic1=$_FILES['sub_cat_image']['tmp_name'];   

			        
			   //Main Image
			   $tpath1='images/'.$sub_cat_image; 
			   copy($pic1,$tpath1); 
						
					 
                    $data = array(
					       'cat_id'  =>  $_POST['cat_id'],
						   'sub_cat_name'  =>  $_POST['sub_cat_name'],
						   'sub_cat_image'  =>  $sub_cat_image,
						);

					$category_edit=Update('tbl_sub_category', $data, "WHERE sid = '".$_POST['sub_cat_id']."'");

		 }
		 else
		 {

          if($_POST['sub_cat_image'])
          {

              $data = array( 
             'cat_id'  =>  $_POST['cat_id'],
             'sub_cat_name'  =>  $_POST['sub_cat_name'],
             'sub_cat_image'  =>  ''
               );

          }
          else
          {
             $data = array(
              'cat_id'  =>  $_POST['cat_id'],
              'sub_cat_name'  =>  $_POST['sub_cat_name']
            );  

          }
 
 
			         $category_edit=Update('tbl_sub_category', $data, "WHERE sid = '".$_POST['sub_cat_id']."'");

		 }

		 
		$_SESSION['msg']="11"; 
		header( "Location:add_sub_category.php?sub_cat_id=".$_POST['sub_cat_id']);
		exit;
 
	}


?>
<div class="row">
      <div class="col-md-12">
        <div class="card">
          <div class="page_title_block">
            <div class="col-md-5 col-xs-12">
              <div class="page_title"><?php if(isset($_GET['sub_cat_id'])){?>Edit<?php }else{?>Add<?php }?> Sub Category</div>
            </div>
          </div>
          <div class="clearfix"></div>
          <div class="row mrg-top">
            <div class="col-md-12">
               
              <div class="col-md-12 col-sm-12">
                <?php if(isset($_SESSION['msg'])){?> 
               	 <div class="alert alert-success alert-dismissible" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                	<?php echo $client_lang[$_SESSION['msg']] ; ?></a> </div>
                <?php unset($_SESSION['msg']);}?>	
              </div>
            </div>
          </div>
          <div class="card-body mrg_bottom"> 
            <form action="" name="addeditcategory" method="post" class="form form-horizontal" enctype="multipart/form-data">
            	<input  type="hidden" name="sub_cat_id" value="<?php echo $_GET['sub_cat_id'];?>" />

              <div class="section">
                <div class="section-body">
                  <div class="form-group">
                    <label class="col-md-3 control-label">Category :-</label>
                    <div class="col-md-6">
                      <select name="cat_id" id="cat_id" class="select2" required>
                        <option value="">--Select Category--</option>
          							<?php
          									while($cat_row=mysqli_fetch_array($cat_result))
          									{
          							?>          						 
          							<option value="<?php echo $cat_row['cid'];?>" <?php if($cat_row['cid']==$row['cat_id']){?>selected<?php }?>><?php echo $cat_row['category_name'];?></option>	          							 
          							<?php
          								}
          							?>
                      </select>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-md-3 control-label">Sub Category Name :-</label>
                    <div class="col-md-6">
                      <input type="text" name="sub_cat_name" id="sub_cat_name" value="<?php if(isset($_GET['sub_cat_id'])){echo $row['sub_cat_name'];}?>" class="form-control" required>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-md-3 control-label">Select Image :-</label>
                    <div class="col-md-6">
                      <div class="fileupload_block">
                        <input type="file" name="sub_cat_image" value="" id="fileupload">
                             
                        	  <div class="fileupload_img"><img type="image" src="assets/images/add-image.png" alt="category image" /></div>
                        	 
                      </div>
                    </div>
                  </div>
                 
                  <div class="form-group">
                    <label class="col-md-3 control-label">&nbsp; </label>
                    <div class="col-md-6">
                      <?php if(isset($_GET['sub_cat_id']) and $row['sub_cat_image']!="") {?>
                            <div class="block_wallpaper"><img src="images/<?php echo $row['sub_cat_image'];?>" alt="category image" /></div>
                          <?php } ?>

                       
                        
                    </div>
                  </div><br>
                  <div class="form-group">
                    <div class="col-md-9 col-md-offset-3">
                      <button type="submit" name="submit" class="btn btn-primary">Save</button>
                    </div>
                  </div>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
        
<?php include("includes/footer.php");?>       
