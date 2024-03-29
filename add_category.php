<?php include("includes/header.php");

  require("includes/function.php");
  require("language/language.php");

  require_once("thumbnail_images.class.php");

   
  
  if(isset($_POST['submit']) and isset($_GET['add']))
  {
   
       //Main Image
       $category_image=rand(0,99999)."_".$_FILES['category_image']['name'];
       
       $tpath1='images/'.$category_image;        
       $pic1=$_FILES["category_image"]["tmp_name"];
       copy($pic1,$tpath1);  
       

       //Icon Image
       $category_image_icon=rand(0,99999)."_".$_FILES['category_image_icon']['name'];

       $tpath2='images/'.$category_image_icon;        
       $pic2=$_FILES["category_image_icon"]["tmp_name"];        
       copy($pic2,$tpath2); 
          
       $data = array( 
         'category_name'  =>  $_POST['category_name'],
         'category_image'  =>  $category_image,
         'category_image_icon'  =>  $category_image_icon
          );    

    $qry = Insert('tbl_category',$data);  
 

    $_SESSION['msg']="10";
 
    header( "Location:manage_category.php");
    exit; 

     
    
  }
  
  if(isset($_GET['cat_id']))
  {
       
      $qry="SELECT * FROM tbl_category where cid='".$_GET['cat_id']."'";
      $result=mysqli_query($mysqli,$qry);
      $row=mysqli_fetch_assoc($result);

  }
  if(isset($_POST['submit']) and isset($_POST['cat_id']))
  {
     
     if($_FILES['category_image']['name']!="" OR $_FILES['category_image_icon']['name']!="")
     {    


          $img_res=mysqli_query($mysqli,'SELECT * FROM tbl_category WHERE cid='.$_GET['cat_id'].'');
          $img_res_row=mysqli_fetch_assoc($img_res);
      
          if($_FILES['category_image']['name']!="")
          {

               if($img_res_row['category_image']!="")
               {
                  unlink('images/'.$img_res_row['category_image']);
               }

               $category_image=rand(0,99999)."_".$_FILES['category_image']['name'];
           
                 //Main Image
               $tpath1='images/'.$category_image;        
               $pic1=$_FILES["category_image"]["tmp_name"];
               copy($pic1,$tpath1);

          }
          else
          {
              $category_image= $img_res_row['category_image'];
          }

          if($_FILES['category_image_icon']['name']!="")
          {
              if($img_res_row['category_image_icon']!="")
               {
                  unlink('images/'.$img_res_row['category_image_icon']);
               }

              //Icon Image
             $category_image_icon=rand(0,99999)."_".$_FILES['category_image_icon']['name'];

             $tpath2='images/'.$category_image_icon;        
             $pic2=$_FILES["category_image_icon"]["tmp_name"];              
             copy($pic2,$tpath2); 
          }
          else
          {   
              $category_image_icon=$img_res_row['category_image_icon'];
          } 
           

            $data = array(
              'category_name'  =>  $_POST['category_name'],
              'category_image'  =>  $category_image,
              'category_image_icon'  =>  $category_image_icon
            );

          $category_edit=Update('tbl_category', $data, "WHERE cid = '".$_POST['cat_id']."'");

     }
     else
     {

           $data = array(
                'category_name'  =>  $_POST['category_name']
            );  
 
               $category_edit=Update('tbl_category', $data, "WHERE cid = '".$_POST['cat_id']."'");

     }
 
    
    $_SESSION['msg']="11"; 
    header( "Location:add_category.php?cat_id=".$_POST['cat_id']);
    exit;
 
  }


?>
<div class="row">
      <div class="col-md-12">
        <div class="card">
          <div class="page_title_block">
            <div class="col-md-5 col-xs-12">
              <div class="page_title"><?php if(isset($_GET['cat_id'])){?>Edit<?php }else{?>Add<?php }?> Category</div>
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
              <input  type="hidden" name="cat_id" value="<?php echo $_GET['cat_id'];?>" />

              <div class="section">
                <div class="section-body">
                  <div class="form-group">
                    <label class="col-md-3 control-label">Category Name :-
                    
                    </label>
                    <div class="col-md-6">
                      <input type="text" name="category_name" id="category_name" value="<?php if(isset($_GET['cat_id'])){echo $row['category_name'];}?>" class="form-control" required>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-md-3 control-label">Category Icon Image :-
                      <p class="control-label-help">(Recommended resolution: 100*100,150*150 ,200*200)</p>
                    </label>
                    <div class="col-md-6">
                      <div class="fileupload_block">
                        <input type="file" name="category_image_icon" value="fileupload" id="fileupload" required>
                            <?php if(isset($_GET['cat_id']) and $row['category_image_icon']!="") {?>
                            <div class="fileupload_img"><img src="images/<?php echo $row['category_image_icon'];?>" alt="category image" style="width: 100px;" /></div>
                          <?php }else {?>
                            <div class="fileupload_img"><img type="image" src="assets/images/add-image.png" alt="category image" /></div>

                          <?php }?>
                            
                      </div>
                    </div>
                  </div>
                  
                  <div class="form-group">
                    <label class="col-md-3 control-label">Category Image :-
                      <p class="control-label-help">(Recommended resolution: 300*300,400*400 or Square Image)</p>
                    </label>
                    <div class="col-md-6">
                      <div class="fileupload_block">
                        <input type="file" name="category_image" value="fileupload" id="fileupload" required>
                            
                            <div class="fileupload_img"><img type="image" src="assets/images/add-image.png" alt="category image" /></div>
                           
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-md-3 control-label">&nbsp; </label>
                    <div class="col-md-6">
                      <?php if(isset($_GET['cat_id']) and $row['category_image']!="") {?>
                            <div class="block_wallpaper"><img src="images/<?php echo $row['category_image'];?>" alt="category image" /></div>
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
