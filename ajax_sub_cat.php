<?php include('includes/connection.php');
      require("includes/function.php");   

		 $category_id=$_GET['id'];
		
		//Get category
		$cat_qry="SELECT * FROM tbl_sub_category where cat_id='".$category_id."'";
		 
		$res=mysqli_query($mysqli,$cat_qry);
				
		echo "<option value=''>-- Select Sub Category --</option>";
				
		while($row=mysqli_fetch_array($res)){
			  
		echo  "<option value='".$row['sid']."'>".$row['sub_cat_name']."</option>";
			
}

?>
    
 
 