<?php
error_reporting(E_ALL);
// includere smarty :
include "check_session.php";

$id_page = 17;
$content = $db->select_fields($db->page, "", "", "page_id", $id_page , "", "", "",1 );
$smarty->assign("content",$content);

$smarty->assign("pages_dir","pages");
$smarty->assign("page","families");
$smarty->display('site_pages.tpl');
?>
