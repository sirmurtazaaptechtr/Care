<?php
    function pr($arr){
        echo "<pre>";
        print_r($arr);
    }
    function prx($arr){
        echo "<pre>";
        print_r($arr);
        die();
    }
    function get_safe_value($connection,$input){ 
        if($input != ''){
            return mysqli_real_escape_string($connection,$input);
        }
    }
    
?>