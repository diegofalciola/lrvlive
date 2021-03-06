<?php 
require_once "WEB-INF/includes/classes/class.x3.database.php";
require_once "WEB-INF/includes/config.php";
require_once "WEB-INF/includes/functions/functions_utils.php";

// includere smarty :
include "WEB-INF/includes/smarty/smarty_site.php";
$db = new DB_config;
$db->connect();

$tour_id 	= trim($_POST['tour_id']);
$selectDate = trim($_POST['selectDate']);
$order_id   = trim($_POST['sid']); //Changed to use Order Id

$order = $db->select_fields($db->order, "", "", 'order_id', $order_id, "", "", "", 1);
if ($order['order_tour_shared_id'] !=0) {
	$_tour_id = $order['order_tour_shared_id'];
} else {
	$_tour_id = $tour_id;
}

$query = "SELECT departure_id, departure_time, boat_passengers, boat_charter_price
FROM $db->departure,  $db->boat
WHERE departure_date = '".$selectDate."'
".(($selectDate == date("Y-m-d"))?" AND departure_time > CURTIME()":"")."
AND departure_boat_id = boat_id
AND departure_tour_id = ".$_tour_id."
AND boat_del = 0
ORDER BY departure_time ASC";
//echo $query; exit();

$fields 	= array("departure_id", "departure_time", "boat_passengers", "boat_charter_price");
$departures = $db->select_fields($db->departure, $query, $fields);
if(!empty($departures))
{
	$returnString ='<div class="departure_top_1"></div>
	<div class="departure_center_1">
	<div class="departure_time_1">Departure Time</div>';
	//$total_passenger = 0;
	foreach($departures as $Dindex=>$Dvalue)
	{
		$query2 = "SELECT * FROM $db->order
		WHERE order_departure_id = '".$Dvalue['departure_id']."'";
		//echo $query2;
		$fields = array("order_tickets", "order_tickets_number");
		$orders = $db->select_fields($db->order, $query2, $fields);
		$sum = 0;
			
		foreach($orders as $orderdata)
		{
			//charter
			if (($orderdata['order_tickets']==0) && ($orderdata['order_tickets_number']==1)) {
				$sum += $Dvalue['boat_passengers'];
			} else {
				//normal
				$sum +=  $orderdata['order_tickets_number'];
			}
		}
		//echo $Dvalue['boat_passengers'];
		//echo "<hr>";

		//exit();
		$total_passenger = 0;
		$total_passenger = $Dvalue['boat_passengers'];
		if(($order['order_tickets']==0) && ($order['order_tickets_number']==1))
		{
			if($sum == 0 && $total_passenger > 0)
			{
				$returnString.='<div class="time_1">'.date("H:i",strtotime($departures[$Dindex]['departure_time'])).'&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="but_radio" onclick="javascript:select_departure(\''.$departures[$Dindex]['departure_id'].'\',\''.$order['order_total'].'\')" /></div>';
			}
		}
		else
		{
			if($Dvalue['boat_passengers'] - $sum >= $order['order_tickets_number'] && $total_passenger > 0)
			{
			 $returnString.='<div class="time_1">'.date("H:i",strtotime($departures[$Dindex]['departure_time'])).'&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="but_radio" onclick="javascript:select_departure(\''.$departures[$Dindex]['departure_id'].'\',\''.$order['order_total'].'\')" /></div>';
			}
		}
	}

	$returnString.='<div class="time_1" style="clear:both;"></div>';
	$returnString.='</div>
	<div class="departure_bottom_1"></div>';
}
else
{
	$returnString ='<div class="departure_top_1"></div>
	<div class="departure_center_1">
	<div class="departure_time_1">Departure Time</div>
	<div class="time_111">No Record(s) <br />Found!.</div>
	</div>
	<div class="departure_bottom_1"></div>';

}
echo $returnString;
//print_r($departures);
?>
