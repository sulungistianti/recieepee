<?php include("includes/header.php");

	require("includes/function.php");
	require("language/language.php");

	
	//Get all sub category 
 

     $tableName="tbl_sub_category";   
      $targetpage = "manage_sub_category.php"; 
      $limit = 10; 
      
      $query = "SELECT COUNT(*) as num FROM $tableName";
      $total_pages = mysqli_fetch_array(mysqli_query($mysqli,$query));
      $total_pages = $total_pages['num'];
      
      $stages = 3;
      $page=0;
      if(isset($_GET['page'])){
      $page = mysqli_real_escape_string($mysqli,$_GET['page']);
      }
      if($page){
        $start = ($page - 1) * $limit; 
      }else{
        $start = 0; 
        } 
      
     $quotes_qry="SELECT * FROM tbl_sub_category
                  LEFT JOIN tbl_category ON tbl_sub_category.cat_id= tbl_category.cid 
                  ORDER BY tbl_sub_category.sid DESC LIMIT $start, $limit";
 
     $result=mysqli_query($mysqli,$quotes_qry); 
	
	if(isset($_GET['sub_cat_id']))
	{ 
		$cat_res=mysqli_query($mysqli,'SELECT * FROM tbl_sub_category WHERE sid=\''.$_GET['sub_cat_id'].'\'');
		$cat_res_row=mysqli_fetch_assoc($cat_res);


		if($cat_res_row['sub_cat_image']!="")
	    {
	    	unlink('images/'.$cat_res_row['sub_cat_image']);
			  unlink('images/thumbs/'.$cat_res_row['sub_cat_image']);

		}
 
		Delete('tbl_sub_category','sid='.$_GET['sub_cat_id'].'');

      
		$_SESSION['msg']="12";
		header( "Location:manage_sub_category.php");
		exit;
		
	}	
 
?>
                
    <div class="row">
      <div class="col-xs-12">
        <div class="card mrg_bottom">
          <div class="page_title_block">
            <div class="col-md-5 col-xs-12">
              <div class="page_title">Manage Sub Categories</div>
            </div>
            <div class="col-md-7 col-xs-12">
              <div class="search_list">
                
                <div class="add_btn_primary"> <a href="add_sub_category.php?add=yes">Add Sub Category</a> </div>
              </div>
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
          <div class="col-md-12 mrg-top">
            <div class="row">
              <?php 
              $i=0;
              while($row=mysqli_fetch_array($result))
              {         
          ?>
              <div class="col-lg-3 col-sm-6 col-xs-12">
                <div class="block_wallpaper add_wall_category">           
                  <div class="wall_category_block">
                    <h2><?php echo $row['category_name'];?></h2>              
                  </div>
                  <div class="wall_image_title">
                    <h2><a href="javascript:void(0)"><?php echo $row['sub_cat_name'];?> </a></h2>
                    <ul>                
                      <li><a href="add_sub_category.php?sub_cat_id=<?php echo $row['sid'];?>" data-toggle="tooltip" data-tooltip="Edit"><i class="fa fa-edit"></i></a></li>               
                      <li><a href="?sub_cat_id=<?php echo $row['sid'];?>" data-toggle="tooltip" data-tooltip="Delete" onclick="return confirm('Are you sure you want to delete this sub category?');"><i class="fa fa-trash"></i></a></li>
                      
                       

                    </ul>
                  </div>
 
                  
                  <span><img src="thumb.php?src=images/<?php echo $row['sub_cat_image'];?>&size=250x200" /></span>
                 
                </div>
              </div>
          <?php
            
            $i++;
              }
        ?>     
               
      </div>
          </div>
           <div class="col-md-12 col-xs-12">
            <div class="pagination_item_block">
              <nav>
                <?php include("pagination.php");?>                 
              </nav>
            </div>
          </div>
          <div class="clearfix"></div>
        </div>
      </div>
    </div>
        
<?php include("includes/footer.php");?>       
