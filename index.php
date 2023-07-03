<?php

  

      $conn = mysqli_connect("localhost", "root", "") or die('There is an error to connect DB' . mysqli_error());
      mysqli_select_db($conn,'testtask2');

      $sql = "SELECT blogs.id, blogs.title, blogs.content, blogs.author_id, category_blogs.category_id, category_blogs.category_title FROM blogs 
      JOIN per ON blogs.id=per.blog_id JOIN category_blogs ON per.category_blog_id=category_blogs.category_id" ;
       $query = mysqli_query( $conn, $sql);
      
       if ($query) {
        $str = '';
        $header = '<tr><td>Blog_id</td><td>Blog_title</td><td>Blog_Content</td><td>Author_id</td><td>Category_id</td><td>Category_title</td></tr>';
        while ($row = mysqli_fetch_array($query)) {
            $str .= '<tr>';
            $blog_id = $row['id'];
            $title = $row['title'];
            $content = $row['content'];
            $athor_id = $row['author_id'];
            $category_id = $row['category_id'];
            $category_title=$row['category_title'];
           
    
            $str .= '<td>' . $blog_id . '</td>';
            $str .= '<td>' .$title  . '</td>';
            $str .= '<td>' . $content  . '</td>';
            $str .= '<td>' . $athor_id  . '</td>';
            $str .= '<td>' .$category_id   . '</td>';
            $str .= '<td>' .$category_title   . '</td>';
           
            $str .= '</tr>';
        }
        if ($str) {
            $table = '<table border="1">' . $header      . $str . '</table>';
        } else {
            $tdata = '<tr><td colspan="5">No data found</td></tr>';
            $table = '<table border="1">' . $header . $tdata . '</table>';
        }
        echo $table;
    }
    echo'<br>';

    $sql1="SELECT  users.fname, users.lname, users.email, blogs.title, blogs.author_id FROM users JOIN blogs ON  users.id =blogs.id ";
    $query1 = mysqli_query( $conn, $sql1);
    if ($query1) {
        $str1 = '';
        $header1 = '<tr><td>Name user</td><td>LastName user</td><td>email user</td><td>Blog-title</td><td>Author_Id</td></tr>';
        while ($row = mysqli_fetch_array($query1)) {
            $str1 .= '<tr>';
            
            $username = $row['fname'];
            $lastname=$row['lname'];
            $email=$row['email'];
            $blog=$row['title'];
            $blog_auth=$row['author_id'];
        
           
    
            
            $str1 .= '<td>' .$username   . '</td>';
            $str1 .= '<td>' .$lastname   . '</td>';
            $str1 .= '<td>' .$email   . '</td>';
            $str1 .= '<td>' .$title   . '</td>';
            $str1 .= '<td>' .$blog_auth   . '</td>';
           
            $str1 .= '</tr>';
        }
        if ($str1) {
            $table1 = '<table border="1">' . $header1      . $str1 . '</table>';
        } else {
            $tdata1 = '<tr><td colspan="5">No data found</td></tr>';
            $table1 = '<table border="1">' . $header1 . $tdata1 . '</table>';
        }
        echo $table1;
    }



















?>