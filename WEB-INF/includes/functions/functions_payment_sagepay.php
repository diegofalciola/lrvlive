<?
/**********************************************************************
** Script Name: Functions.php                                        **
** Version:     1.3 - 21-jan-05                                      **
** Author:      Pat Fox                                              **
** Function:    Contains simple procedures to encode, encrypt,       **
**              decode, decrypt and split the information POSTed     **
**              to and from VSP Form.                                **
**                                                                   **
** Revision History:                                                 **
** Version  Author     Date and notes                                **
**    1.0   Mat Peck   18/01/2002 - First ASP release                **
**    1.1   Mat Peck   07/03/2002 - Base64 routines patched          **
**    1.2   Pat Fox    29/07/2002 - PHP version                      **
**    1.2   Tony Welch 9/07/2003 - Addition of post code fields 2.21 **
**    1.3   Peter G    21-jan-05 - Add new 2.22 response fields      **
***********************************************************************/

// ** Set variables to indentify the vendor **

  //$VendorName="londonrib";
  //$EncryptionPassword="CzjZd2yZ4jTr9CLm"; 
  
  //$EncryptionPassword="cle09hm8rDQ96AlY";
  
  //NEW
  $VendorName="londonribvoyage";
  $EncryptionPassword="GAzHuWWJyBg6mZyj"; 
	

  $URL = "http://www.londonribvoyages.com/booking.php?subpage=step8";
//  $URL = "http://new.londonrib.goclients.com/booking.php?subpage=step8";
//  $URL = "http://new.londonribvoyages.com/booking.php?subpage=step8";
  
//** Your server's IP address or dns name and web app directory.  Fully qualified **
//** Examples : $MyServer="https://www.newco.com/php-form-kit/", $MyServer="192.168.0.1/php-form-kit", $MyServer="http://localhost/php-form-kit/" **

  $MyServer="http://www.londonribvoyages.com/";
//  $MyServer="http://new.londonrib.goclients.com/";
//  $MyServer="http://new.londonribvoyages.com/";

//*********************************************************************************
// The protx site to send information to **

  //** Simulator site **
  //$vspsite = "https://ukvpstest.protx.com/VSPSimulator/VSPFormGateway.asp";

  //** Test site **
  // $vspsite="https://ukvpstest.protx.com/vps2form/submit.asp";
  
  //** Live site - ONLY uncomment when going live **
  $vspsite="https://ukvps.protx.com/vps2form/submit.asp";  

  $vspsite="https://live.sagepay.com/gateway/service/vspform-register.vsp";
//*********************************************************************************
// ** Base 64 Encoding function **
// PHP does it natively but just for consistency and ease of maintenance, let's declare our own function
function base64Encode($plain) {
  // Initialise output variable
  $output = "";
  
  // Do encoding
  $output = base64_encode($plain);
  
  // Return the result
  return $output;
}


/* Base 64 decoding function **
** PHP does it natively but just for consistency and ease of maintenance, let's declare our own function **/
function base64Decode($scrambled) {
  // Initialise output variable
  $output = "";
  
  // Fix plus to space conversion issue
  $scrambled = str_replace(" ","+",$scrambled);
  
  // Do encoding
  $output = base64_decode($scrambled);
  
  // Return the result
  return $output;
}


/*  The SimpleXor encryption algorithm                                                                                **
**  NOTE: This is a placeholder really.  Future releases of Form will use AES or TwoFish.  Proper encryption      **
**  This simple function and the Base64 will deter script kiddies and prevent the "View Source" type tampering        **
**  It won't stop a half decent hacker though, but the most they could do is change the amount field to something     **
**  else, so provided the vendor checks the reports and compares amounts, there is no harm done.  It's still          **
**  more secure than the other PSPs who don't both encrypting their forms at all                                      */

function simpleXor($InString, $Key) {
  // Initialise key array
  $KeyList = array();
  // Initialise out variable
  $output = "";
  
  // Convert $Key into array of ASCII values
  for($i = 0; $i < strlen($Key); $i++){
    $KeyList[$i] = ord(substr($Key, $i, 1));
  }

  // Step through string a character at a time
  for($i = 0; $i < strlen($InString); $i++) {
    // Get ASCII code from string, get ASCII code from key (loop through with MOD), XOR the two, get the character from the result
    // % is MOD (modulus), ^ is XOR
    $output.= chr(ord(substr($InString, $i, 1)) ^ ($KeyList[$i % strlen($Key)]));
  }

  // Return the result
  return $output;
}

function getToken($thisString) {

  // List the possible tokens
  $Tokens = array(
    "Status",
    "StatusDetail",
    "VendorTxCode",
    "VPSTxId",
    "TxAuthNo",
    "Amount",
    "AVSCV2", 
    "AddressResult", 
    "PostCodeResult", 
    "CV2Result", 
    "GiftAid", 
    "3DSecureStatus", 
    "CAVV",
	"AddressStatus",
	"CardType",
	"Last4Digits",
	"PayerStatus");

  // Initialise arrays
  $output = array();
  $resultArray = array();
  
  // Get the next token in the sequence
  for ($i = count($Tokens)-1; $i >= 0 ; $i--){
    // Find the position in the string
    $start = strpos($thisString, $Tokens[$i]);
	// If it's present
    if ($start !== false){
      // Record position and token name
      $resultArray[$i]->start = $start;
      $resultArray[$i]->token = $Tokens[$i];
    }
  }
  
  // Sort in order of position
  sort($resultArray);
	// Go through the result array, getting the token values
  for ($i = 0; $i<count($resultArray); $i++){
    // Get the start point of the value
    $valueStart = $resultArray[$i]->start + strlen($resultArray[$i]->token) + 1;
	// Get the length of the value
    if ($i==(count($resultArray)-1)) {
      $output[$resultArray[$i]->token] = substr($thisString, $valueStart);
    } else {
      $valueLength = $resultArray[$i+1]->start - $resultArray[$i]->start - strlen($resultArray[$i]->token) - 2;
	  $output[$resultArray[$i]->token] = substr($thisString, $valueStart, $valueLength);
    }      

  }

  // Return the ouput array
  return $output;
}

// Randomise based on time
function randomise() {
    list($usec, $sec) = explode(' ', microtime());
    return (float) $sec + ((float) $usec * 100000);
}

function generate_crypt($ThisVendorTxCode, $ThisAmount, $ThisDescription, $ThisCustomerEmail, $ThisCustomerName, $ThisVendorEmail,
	$ThisDeliveryAddress, $ThisDeliveryPostCode, $MyURL = ""){
	global $EncryptionPassword;
	global $URL;
	if (!empty($MyURL)) $URL = $MyURL;
	
	$ThisCurrency = "GBP";
	$ThisShoppingBasket="OFF";  
	
	//** Build the crypt string plaintext **
	$stuff = "VendorTxCode=" . $ThisVendorTxCode . "&";
	$stuff .= "Amount=" . $ThisAmount . "&";
	$stuff .= "Currency=" . $ThisCurrency . "&";
	$stuff .= "Description=" . $ThisDescription . "&";
	//$stuff .= "SuccessURL=http://www.x3studios.com/clients/londonrib_cms/booking.php&";
	//$stuff .= "FailureURL=http://www.x3studios.com/clients/londonrib_cms/contact.htm&";
	$stuff .= "SuccessURL=".$URL."&";
	$stuff .= "FailureURL=".$URL."&";
	
	if (!empty($ThisCustomerEmail)) {
	  $stuff .= "CustomerEmail=" . $ThisCustomerEmail . "&";
	}
	if (!empty($ThisVendorEmail)) {
	  $stuff .= "VendorEmail=" . $ThisVendorEmail . "&";
	}
	if (!empty($ThisCustomerName)) {
	  $stuff .= "CustomerName=" . $ThisCustomerName . "&";
	}
	if (!empty($ThisDeliveryAddress) && !empty($ThisDeliveryPostCode)) {
	  $stuff .= "BillingAddress=" . $ThisDeliveryAddress . "&";
	  $stuff .= "BillingPostCode=" . $ThisDeliveryPostCode . "&";

	}	
	if (!empty($ThisDeliveryPostCode)) {
//	  $stuff .= "BillingPostCode=" . $ThisDeliveryPostCode . "&";
	}		


	$stuff .= "EMailMessage=Thank you for purchasing your ticket with London RIB  Voyages.";

	// ** Encrypt the plaintext string for inclusion in the hidden field **
	//$crypt = base64Encode(SimpleXor($stuff,$EncryptionPassword));
	return base64Encode(SimpleXor($stuff,$EncryptionPassword));
}

function decode_crypt($crypt){
	global $EncryptionPassword;
	echo $Decoded=SimpleXor(base64Decode($crypt),$EncryptionPassword);
	
	$values = getToken($Decoded);
	//print_r($values);	
	return array("code"=>$values['VendorTxCode'],"status"=>$values['Status']);
}
?>
