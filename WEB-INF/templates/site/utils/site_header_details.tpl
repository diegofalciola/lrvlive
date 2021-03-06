<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>{if $content.page_title != ""} {$content.page_title} {else} London RIB Voyages{/if}</title>
{$MycontentpageMeta}
{if $subpage == '_tour_details'}
{$tour.page_meta}
{elseif $subpage == '_package_details'}
{$package.page_meta}
{else}
{$content.page_meta}
{/if}
<link href="WEB-INF/assets/css/slider.css" rel="stylesheet" type="text/css" />
<link href="WEB-INF/assets/css/style.css" rel="stylesheet" type="text/css" />
{if $page == "location"}
{literal}
 <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAk_PeATHc7Zk4v935p5iMORQyasHvbimZ52QT_h2fTtA71RTODRQ4xDTS8sZxMt0yUhjUPYWjkGCeew" type="text/javascript"></script>
<script type="text/javascript">
    //<![CDATA[
		var WINDOW_HTML = '<div style="width: 210px; padding-right: 10px">London Rib Voyages 39 York Rd Lambeth, Greater London SE1 7, UK</div>';		

    function load() {
      if (GBrowserIsCompatible()) {
        var map = new GMap2(document.getElementById("mapsearch"));
        	map.addControl(new GSmallMapControl());
			map.addControl(new GMapTypeControl());
        map.setMapType(G_HYBRID_MAP);
        map.setCenter(new GLatLng(51.503293230761045, -0.11954069137573242), 16);
        
        var marker = new GMarker(new GLatLng(51.503293230761045, -0.11954069137573242));
				map.addOverlay(marker);
				GEvent.addListener(marker, "click", function() {
				marker.openInfoWindowHtml(WINDOW_HTML);
				  });
				//marker.openInfoWindowHtml(WINDOW_HTML);		
      }
    }
    //]]>
    </script>
{/literal} 
{/if}
{literal}
<script type="text/javascript" src="WEB-INF/includes/js/main.js"></script>
<script type="text/javascript" src="WEB-INF/includes/js/pngfix.js"></script>
<script type="text/javascript" src="WEB-INF/includes/js/flash.js"></script>
<script type="text/javascript">
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-23852518-1']);
  _gaq.push(['_trackPageview']);

 (function() {
   var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
</script>
{/literal}
{if $page=="route"}
{literal}
        <script language="javascript" type="text/javascript">
        function hidediv() {
            if (document.getElementById) { // DOM3 = IE5, NS6
                document.getElementById('hideshow').style.visibility = 'hidden';
            }
            else {
                if (document.layers) { // Netscape 4
                    document.hideshow.visibility = 'hidden';
                }
                else { // IE 4
                    document.all.hideshow.style.visibility = 'hidden';
                }
            }
        }
        function _absLeft(obj) { return (obj.offsetParent)? obj.offsetLeft+_absLeft(obj.offsetParent) : obj.offsetLeft; }
        function _absTop(obj) { return (obj.offsetParent)? obj.offsetTop+_absTop(obj.offsetParent) : obj.offsetTop; }
        function showdiv(item) {
            itemId = item.id;
            itemId = itemId.substring(4,itemId.length-2);

            parentE = document.getElementById('pd'+itemId);
			
            //parentE = item.parentNode.parentNode;

            closeButton = document.createElement('a');
            closeButton.setAttribute('href','javascript:hidediv()');
            {/literal}
            closeButton.innerHTML = '<img src="http://{$smarty.server.SERVER_NAME}/img/css/bclose.gif" width="13" height="13" alt="Close" title="Close" style="position:absolute;" border="0" />';
            {literal}

            nTable 	= document.createElement('table');
            nBody 	= document.createElement('tbody');
            nTr 	= document.createElement('tr');

            //itemNumber = parentE.firstChild.firstChild;
			itemNumber = document.getElementById("pv"+itemId);
			//itemName = itemNumber.parentNode.nextSibling.firstChild;
			itemName = document.getElementById("pn"+itemId);
            //itemText = parentE.lastChild;
			itemText   = document.getElementById("Text"+itemId)
			
			//alert(itemText);
			//return false;

            itemTextContent = itemText.innerHTML;


            nTd1 = document.createElement('td');
            nTd2 = document.createElement('td');
			nTd1.setAttribute('class','style_vertical');
			nTd2.setAttribute('class','style_vertical');

            nTd1.innerHTML = '<span class="style_heading_text">'+itemNumber.innerHTML+'.&nbsp;'+itemName.innerHTML+'</span><br /><span class="style_normal_text">'+itemTextContent+'</span>';
            {/literal}
            nTd2.innerHTML = '<img src="http://{$smarty.server.SERVER_NAME}/img/route/'+itemId+'.jpg" width="119" height="138" alt="'+itemName.innerHTML+'" title="'+itemName.innerHTML+'" />';
            {literal}
			
            nTr.appendChild(nTd1);
            nTr.appendChild(nTd2);

            nBody.appendChild(nTr);

            detty = document.createElement('div');
            detty.setAttribute('class','detty');

            nTable.appendChild(nBody);
            detty.appendChild(nTable);

            dettop = document.createElement('div');
            dettop.setAttribute('class','dettop');
			

            if (document.getElementById) { // DOM3 = IE5, NS6
                element = document.getElementById('anchor');
                deltaX = _absLeft(element)+155;
                deltaY = _absTop(element)-150;

                if(document.getElementById('hideshow').hasChildNodes()){document.getElementById('hideshow').removeChild(document.getElementById('hideshow').firstChild);document.getElementById('hideshow').removeChild(document.getElementById('hideshow').firstChild);}
                {/literal}
                document.getElementById('hideshow').innerHTML = '<div class="dettop"><a href="javascript:hidediv()"><img src="http://{$smarty.server.SERVER_NAME}/img/css/bclose.gif" alt="Close" title="Close" style="position: absolute;margin:27px 0px 0px 412px;" height="13" width="13" border="0"></a></div><div class="detty" id="detty"></div><div class="detbot"></div>';
                {literal}
                //document.getElementById('hideshow').appendChild(closeButton);
                document.getElementById('detty').appendChild(nTable);
                document.getElementById('hideshow').style.left = deltaX+'px';
                document.getElementById('hideshow').style.top = deltaY+'px';
                document.getElementById('hideshow').style.visibility = 'visible';
            }
            else {
                if (document.layers) { // Netscape 4
                    document.hideshow.visibility = 'visible';
                }
                else { // IE 4
                    document.all.hideshow.style.visibility = 'visible';
                }
            }
        }
        function _clearEvent(event) {if(event.preventDefault) {event.preventDefault();event.returnValue = false;} else {window.event.returnValue = false;}}
        function rollUp(item)
        {
            itemId = item.id;
            itemId = itemId.substring(4,itemId.length-2);
        }
        function rollDown(item)
        {
            itemId = item.id;
            itemId = itemId.substring(4,itemId.length-2);
        }
        </script>
{/literal}
{/if}
{if $subpage=="_tour_details" || $subpage=="_package_details" || $subpage=="_voucher_details"}
{literal}
		<script type="text/javascript" src="WEB-INF/includes/js/prototype.js"></script>
		<script type="text/javascript" src="WEB-INF/includes/js/scriptaculous.js?load=effects"></script>
		<script type="text/javascript" src="WEB-INF/includes/js/lightbox.js"></script>
		<link rel="stylesheet" href="WEB-INF/assets/css/lightbox.css" type="text/css" media="screen" />
{/literal}
{/if}

{if $page=="experience"}
{literal}
        <style type="text/css">
            .rightT {margin-top:-576px;}
            .rightT[class] {margin-top:-576px;}
        </style>
{/literal}
{/if}
{if $page=="route"}
{literal}
        <script language="javascript" type="text/javascript">
        function _clearEvent(event) {if(event.preventDefault) {event.preventDefault();event.returnValue = false;} else {window.event.returnValue = false;}}
        function rollUp(item)
        {
            itemId = item.id;
            itemId = itemId.substring(4,itemId.length-2);
        }
        function rollDown(item)
        {
            itemId = item.id;
            itemId = itemId.substring(4,itemId.length-2);
        }
        </script>
{/literal}
{/if}
{if $page=="safety" or $page=="vessels" or $page=="booking"}
{literal}
        <style type="text/css">
            .rightT {margin-top:-534px;}
            .rightT[class] {margin-top:-534px;}
        </style>
{/literal}
{/if}
{if $page=="location"}
{literal}
        <style type="text/css">
            .rightT {margin-top:-663px;}
            .rightT[class] {margin-top:-663px;}
        </style>
{/literal}
{/if}
{if $page=="contact" or $page=="links"}
{literal}
        <style type="text/css">
            .rightT {margin-top:-440px;}
            .rightT[class] {margin-top:-440px;}
        </style>
{/literal}
{/if}
{if $subpage=="_select"}
{literal}
        <script src="WEB-INF/includes/js/lib.js" type="text/javascript"></script>
        <script src="WEB-INF/includes/js/popup.js" type="text/javascript"></script>
        <style type="text/css">
            .rightT {margin-top:-522px;}
            .rightT[class] {margin-top:-522px;}
        </style>
{/literal}
{/if}
        <script language="javascript" src="WEB-INF/includes/js/macromedia.js" type="text/javascript"></script>
{if $subpage=="_step1"}
        <script language="javascript" src="WEB-INF/includes/js/step1-1.js" type="text/javascript"></script>
{/if}
{if $subpage=="_step2"}
        <script language="javascript" src="WEB-INF/includes/js/step2.js" type="text/javascript"></script>
{/if}
{if $subpage=="_step3"}
        <script language="javascript" src="WEB-INF/includes/js/step3.js" type="text/javascript"></script>
{/if}
{if $subpage=="_step4"}
		<script language="javascript" src="WEB-INF/includes/js/validation.js" type="text/javascript"></script>  
        <script language="javascript" src="WEB-INF/includes/js/step4.js" type="text/javascript"></script>
	{literal}
    <script language="javascript" type="text/javascript">
    <!--
    function init_address() {
        define('order_first_name', 'string', 'First Name',3, 50);
        define('order_last_name', 'string', 'Last Name',3, 50);
        define('order_phone', 'string', 'Phone',10);
        define('order_email', 'email', 'Email',6);
    }
    -->
    </script>
    {/literal}  
{/if}
{if $subpage=="_step5"}
        <script language="javascript" src="WEB-INF/includes/js/validation.js" type="text/javascript"></script>  
        <script language="javascript" src="WEB-INF/includes/js/step5.js" type="text/javascript"></script>
    {literal}
    <script language="javascript" type="text/javascript">
    <!--
    function init_address() {
        define('order_first_name', 'string', 'First Name',3, 50);
        define('order_last_name', 'string', 'Last Name',3, 50);
        define('order_phone', 'string', 'Phone',10);
        define('order_email', 'email', 'Email',6);
    }
    -->
    </script>
    {/literal}  
{/if}
{if $subpage=="_step6"}
    <script language="javascript" src="WEB-INF/includes/js/step6.js" type="text/javascript"></script>
{/if}
{if $subpage=="_step8"}
	<!-- STEP 8 - Google Analytics -->
	{if $results.status=="OK"}{literal}		 
		<script language="javascript" type="text/javascript">
		  var _gaq = _gaq || [];
		  _gaq.push(['_setAccount', 'UA-23852518-1']);
		  _gaq.push(['_trackPageview']);
		  _gaq.push(['_addTrans',{/literal}
			'{$ga_trans.order_id}',           // order ID - required
			'{$ga_trans.store_name}',  // affiliation or store name
			'{$ga_trans.total}',          // total - required
			'{$ga_trans.tax}',           // tax
			'{$ga_trans.shipping}',              // shipping
			'{$ga_trans.city}',       // city
			'{$ga_trans.state}',     // state or province
			'{$ga_trans.country}'             // country{literal}			 
		  ]);

		   // add item might be called for every item in the shopping cart
		   // where your ecommerce engine loops through each item in the cart and
		   // prints out _addItem for each
		    {/literal}
		  {foreach from=$ga_items key=id item=ticket}
		_gaq.push(['_addItem',
				'{$ticket.order_id}',           // order ID - required
				'{$ticket.code}',           // SKU/code - required
				"{$ticket.product}",        // product name
				"{$ticket.variation}",   // category or variation
				"{$ticket.unit_price}",          // unit price - required
				"{$ticket.quantity}"               // quantity - required
			  ]);
		  {/foreach}{literal}		   
		  _gaq.push(['_trackTrans']); //submits transaction to the Analytics servers

		  (function() {
			var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
		  })();
		</script>
		 {/literal}
	{/if}
{/if}
{if $subpage=="_voucher_step1"}
        <script language="javascript" src="WEB-INF/includes/js/validation.js" type="text/javascript"></script>  
        <script language="javascript" src="WEB-INF/includes/js/voucher_step1.js" type="text/javascript"></script>
    {literal}
    <script language="javascript" type="text/javascript">
    <!--
    function init_address() {
        define('voucher_order_to', 'string', 'Name of person to receive this Voucher',3, 50);
        define('voucher_order_phone_to', 'string', 'Phone number of receiver',5);
        define('voucher_order_email', 'email', 'Email of sender',6);
        define('voucher_order_name', 'string', 'Name of sender',4);
        define('voucher_order_phone', 'string', 'Telephone of sender',4);
        define('voucher_order_name_to', 'string', 'Name of the person voucher to be posted to',4);
        define('voucher_order_address1_to', 'string', 'Address of where the voucher is to be posted',4);
        define('voucher_order_message', 'string', 'Message from sender', 0, 500);
        //define('voucher_order_address1', 'string', 'Address 1',10);
        //define('voucher_order_postcode', 'string', 'Postcode',4);
    }
    -->
    </script>
    {/literal}  
{/if}
{if $subpage=="_voucher_step2"}
        <script language="javascript" src="WEB-INF/includes/js/voucher_step2.js" type="text/javascript"></script>
{/if}

{if $page=="route"}
    <script language="javascript" src="WEB-INF/includes/js/exp_col.js" type="text/javascript"></script>
{/if}

	
</head>
{strip}
<body {if $subpage=="_step4" || $subpage=="_voucher_step1"}onload="init_address();"{elseif  $page=="location"}onload="load();"{/if}>
{/strip}

<!-- Digital Savannah Facebook re-messaging tags -->
{literal} 
    <div id="ttdUniversalPixelTag4a9161caa8c54b588047dde860cf3d9f" style="display:none">
        <script src="https://js.adsrvr.org/up_loader.1.1.0.js" type="text/javascript"></script>
        <script type="text/javascript">
            (function(global) {
                if (typeof TTDUniversalPixelApi === 'function') {
                    var universalPixelApi = new TTDUniversalPixelApi();
                    universalPixelApi.init("0bevose", ["kx216da"], "https://insight.adsrvr.org/track/up", "ttdUniversalPixelTag4a9161caa8c54b588047dde860cf3d9f");
                }
            })(this);
        </script>
    </div>
	{/literal} 
<!-- Digital Savannah Facebook re-messaging tags -->

<div class="main_body">
	<div class="wrap_body_pat1">
		<div class="building_main">
		
		<!-- slider -->
		 <div class="slider-wrapper theme-default">
            <div id="slider" class="nivoSlider">
                <img src="images/header-slide-1.jpg" data-thumb="images/header-slide-1.jpg" alt="" />
                <img src="images/header-slide-2.jpg" data-thumb="images/header-slide-2.jpg" alt="" />			
			</div>
			<div class="home-slide-book-button">
				<a href="/booking.php?subpage=tours" title="book now"><img src="images/book-now-1-home-slide.png" data-thumb="images/header-slide-2.jpg" height="92" width="404" alt="" /></a>
			</div>
        </div>
		<!-- end slider -->

		</div>
									<div class="secondmain_about_main_body">
									<div class="secondmain_about_body float_left">
										<!--div class="lap_2"></div-->
										<div>
										<div class="secondmain_wrap">
											<div class="navmain_body">
											<!--Nav -->
												<div class="menu_top{if $page==index} homenav {elseif $page==contact} contactnav {elseif $page==safety} safetynav {elseif $page==location} locationnav {/if}">
													<ul>
														<li><a href="index.php" title="Home" class="home {if $page!=index} home_visited {else} selected {/if}">Home</a></li>
														<li><a href="about_us.php" title="About Us" class="about_us1 {if  $page == 'about_us' || $page == 'about_us_people_say' || $page == 'about_us_guides' || $page == 'about_us_videos' || $page == 'about_us_our_boat' || $page == 'about_us_guides_matt1' || $page == 'about_us_guides_matt2' || $page == 'about_us_guides_dave' || $page == 'about_us_guides_ben' || $page == 'about_us_guides_nick' || $page == 'route'} selected {/if}">About Us</a></li>
														<li><a href="booking.php?subpage=tours" title="Our Boat Trips" {if  $subpage == '_select' || $subpage == '_tours'  || $subpage == '_tour_details' || $subpage == '_charter' || $subpage == '_voucher_details' || $subpage == '_package_details'} class="ourboat_trip selected" {else} class="ourboat_trip" {/if}>Our Boat Trips</a></li>
														<li><a href="who_is_this_for.php" title="Who is this for?" class="Who_is_this{if  $page == 'who_is_this_for' || $page == 'stag_and_hen' || $page == 'individuals_couples_friends' || $page == 'families' || $page == 'corporate_groups'} selected {/if}"> Who is this for?</a></li>
														<li><a href="safety.php" title=" Safety" class="safety {if $page=='safety'}selected{/if}"> Safety</a></li>
														<li><a href="location.php" title="Our Location" class="vessel {if $page=='location'}selected{/if}"> Our Location</a></li>
														<li><a href="about_us_people_say.php" title="Testimonials" class="testimonials {if $page == 'blog'}selected{/if}">Testimonials</a></li>
						                                <li><a href="http://londonribvoyages.wordpress.com" title="Blog" class="blog">Blog</a></li>
                                                        <!--li><a href="filming.php" title="Filming" class="{if $page=='filming'}selected {else}safety{/if}">Filming</a></li-->
														<li class="contact"><a href="contact.php" title="Contact Us" class="contact {if $page == 'contact'} selected {/if}"> Contact Us</a></li>
													</ul>
												</div>
											<!--Nav -->
					{if 
						$page == "about_us" 
					|| $page == "about_us_people_say" 
					|| $page == 'about_us_guides'
					|| $page == 'about_us_videos' 
					|| $page == "about_us_our_boat"
					|| $page == 'about_us_guides_matt1' 
					|| $page == 'about_us_guides_matt2' 
					|| $page == 'about_us_guides_dave' 
					|| $page == 'about_us_guides_ben' 
					|| $page == 'about_us_guides_nick'
					|| $page == 'route'
					}
					
					<div class="menu_bottom">
					<a href="about_us_people_say.php" class="{if $page == 'about_us_people_say'} about_link_1a {else} about_link_1 {/if}" title="Testimonials">Testimonials</a>&nbsp;&nbsp;<span style="color:#FFFFFF;"><strong>|</strong></span>&nbsp;&nbsp;<a href="about_us_guides.php" class="{if $page == 'about_us_guides' || $page == 'about_us_guides_matt1' || $page == 'about_us_guides_matt2' || $page == 'about_us_guides_dave' || $page == 'about_us_guides_ben' || $page == 'about_us_guides_nick'} about_link_1a {else}about_link_1{/if}" title="Meet Our Guidess">Meet Our Guides</a>&nbsp;&nbsp;<span style="color:#FFFFFF;"><strong>|</strong></span>&nbsp;&nbsp;<a href="https://www.youtube.com/channel/UC_78eKTUZPWQv7Yhb6jIJVA" target="_blank" class="{if $page == 'about_us_videos'} about_link_1a {else} about_link_1 {/if}" title="Our Videos">Our Videos</a>&nbsp;&nbsp;<span style="color:#FFFFFF;"><strong>|</strong></span>&nbsp;&nbsp;<a href="about_us_our_boat.php" target="_blank" class="{if $page == 'about_us_our_boat'} about_link_1a {else}about_link_1{/if}" title="Our Boat">Our Boat</a>&nbsp;&nbsp;<span style="color:#FFFFFF;"><strong>|</strong></span>&nbsp;&nbsp;<a href="route.php" class="{if $page == 'route'} about_link_1a {else}about_link_1{/if}" title="Our Route">Our Route</a>		
					</div>
					{elseif 
					   $page == "who_is_this_for" 
					|| $page == "stag_and_hen" 
					|| $page == "individuals_couples_friends" 
					|| $page == "families" 
					|| $page == 'corporate_groups'
					}
					
					<div class="menu_bottom">
					<a href="individuals_couples_friends.php" class="{if $page == 'individuals_couples_friends'} about_link_1a {else}about_link_1{/if}" title="Individuals, Couples and Friends">Individuals, Couples and Friends</a>&nbsp;&nbsp;<span style="color:#FFFFFF;"><strong>|</strong></span>&nbsp;&nbsp;<a href="families.php" class="{if $page == 'families'} about_link_1a {else}about_link_1{/if}" title="Families">Families </a>&nbsp;&nbsp;<span style="color:#FFFFFF;"><strong>|</strong></span>&nbsp;&nbsp;     
					<a href="stag_and_hen.php" class="{if $page == 'stag_and_hen'} about_link_1a {else} about_link_1{/if}" title="Stag and Hen Group">Stag and Hen Group</a> &nbsp;&nbsp;<span style="color:#FFFFFF;"><strong>|</strong></span>&nbsp;&nbsp;	
					<a href="corporate_groups.php" class="{if $page == 'corporate_groups'} about_link_1a {else}about_link_1{/if}" title="Corporate Groups"> Corporate Groups</a>											
					</div>
					
					{elseif 
						$subpage=="_tours"  
					||  $subpage == '_charter'
					||  $subpage == '_voucher_details'
					||  $subpage == '_package_details'
					}

					
						<div class="menu_bottom">
					{section name=k loop=6 start=0}
					{if $Tour_Trip[k].tour_home_name1 ne ""}	
					{if $Tour_Trip[k].tour_home_name1 ne "Sunset Speed-boating"}
					{if $Tour_Trip[k].tour_home_name1 ne 'Tower Refresher (@St Kats)'}	
					<a href="booking.php?tour_id={$Tour_Trip[k].tour_id}&amp;subpage=tour_details" class="{if $Tour_Trip[k].tour_id == $smarty.get.tour_id} about_link_1a {else}about_link_1{/if}" title="{$Tour_Trip[k].tour_home_name1}">{$Tour_Trip[k].tour_home_name1}</a>&nbsp;<span style="color:#FFFFFF;"><strong>|</strong></span>&nbsp;
					{/if}
					{/if}
					{/if}
					{/section}
					<a href="booking.php?subpage=charter" class="{if $subpage=='_charter' ||  $subpage == '_package_details'} about_link_1a {else}about_link_1{/if}" title="Charters">Charters</a>
					</div>	
					
					{elseif  
						$subpage == '_tour_details'
					}
					<div class="menu_bottom">		
					{section name=k loop=6 start=0}
					{if $Tour_Trip[k].tour_home_name1 ne ''}	
					{if $Tour_Trip[k].tour_home_name1 ne "Sunset Speed-boating"}
					{if $Tour_Trip[k].tour_home_name1 ne 'Tower Refresher (@St Kats)'}		
					<a href="booking.php?tour_id={$Tour_Trip[k].tour_id}&amp;subpage=tour_details" class="{if $Tour_Trip[k].tour_id == $smarty.get.tour_id} about_link_1a {else}about_link_1{/if}" title="{$Tour_Trip[k].tour_home_name1}">{$Tour_Trip[k].tour_home_name1}</a>&nbsp;<span style="color:#FFFFFF;"><strong>|</strong></span>&nbsp;
					{/if}
					{/if}
					{/if}
                    {/section}
                   
					<a href="booking.php?subpage=charter" class="{if $subpage=='_charter'} about_link_1a {else}about_link_1{/if}" title="Charters">Charters</a>
					</div>
					
					{elseif 
						$page == 'media_center'
					||	$page == 'press_office'
					||	$page == 'press_release'
					||  $page == 'links'					}
					<div class="menu_bottom">
					<a href="press_release.php" class="{if $page == 'press_release'} about_link_1a {else}about_link_1{/if}" title="Press Releases">Press Releases </a>&nbsp;<span style="color:#FFFFFF;"><strong>|</strong></span>&nbsp;   
					  
					<a href="links.php" class="{if $page == 'links'} about_link_1a {else} about_link_1{/if}" title="Links">Links</a>
					</div>
					
					{else}	<!--div class="menu_bottom">&nbsp;</div-->{/if}
					</div>
