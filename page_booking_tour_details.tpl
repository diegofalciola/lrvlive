							<div class="lr_body float_left">
										  	<div class="lr_left_r1">
												<div class="pep_left_r1_top"></div>
											  <div class="pep_left_r1_middle">
												<div class="style_tour_details">
												<div class="style_tour_details_2">
												<div class="style_tour_details_3"><h2 class="ab_text_1">{$tour.tour_name}</h2></div>
												<div class="style_tour_details_5 text_4">{$tour.tour_full_description}</div>
												</div>	
												</div>
								  				<div class="clear_both"></div>
											  </div>
											  <div class="pep_left_r1_bottom"></div>	
											</div>
											<div class="lr_right_r1">
												<div><img src="img/tours/thumb/{$tour.tour_big_image}" alt="{$tourTmp.tour_big_image_altTitle}" title="{$tourTmp.tour_big_image_altTitle}" class="style_border2"/></div>
													<div>&nbsp;</div>
													<div style="clear:both"></div>
													<div style=" float:left;width:398px; text-align:center;">
													{if $image1}
														<div style="float:left;width:130px;"><a href="img/tours/large/{$tour.tour_image1}" rel="lightbox[roadtrip]"><img src="img/tours/thumb/{$tour.tour_image1}" alt="" class="selectpic style_border2" /></a></div>
													{/if}	
													{if $image2}
														<div style="float:left;width:130px;"><a href="img/tours/large/{$tour.tour_image2}" rel="lightbox[roadtrip]"><img src="img/tours/thumb/{$tour.tour_image2}" alt="" class="selectpic style_border2" /></a></div>
													{/if}	
													{if $image3}
														<div style="float:left;width:130px;"><a href="img/tours/large/{$tour.tour_image3}" rel="lightbox[roadtrip]"><img src="img/tours/thumb/{$tour.tour_image3}" alt="" class="selectpic style_border2" /></a></div>
													</div>
													{/if}
											  <div>
											  <div style="clear:both"></div>
											  <div class="ultimate_1">
														<div class="ultimate_top1_nd1">
														<div class="ultimate_ticket_nd1">
														<div class="ultimate_ticket_child1_nd1">Ticket Type: </div>
														<div class="ultimate_ticket_child2_nd1">Prices:</div>
														</div></div>
														<div class="ultimate_middle1">
														<div class="ultimate2_main">
														<div class="ultimate2_main1">
														{section name=i loop=$tickets}
														<div class="ultimate_ticket_child1_nd1">
														<span class="ultimate_txt">{$tickets[i].ticket_type}</span></div>
														<div class="ultimate_ticket_child2_nd1"><span class="ultimate_txt">&pound;{$tickets[i].ticket_price}</span></div>
														{/section}
														<div class="ultimate_ticket_child1_nd1"> <span class="ultimate_txt_new">Special Offer:</span></div>
														<div class="ultimate_ticket_child2_nd1"><span class="ultimate_txt_new">Prices</span></div>
														{section name=i loop=$special_tickets}
														<div class="ultimate_ticket_child1_nd1">
														<span class="ultimate_txt">{$special_tickets[i].ticket_type}</span></div>
														<div class="ultimate_ticket_child2_nd1"><span class="ultimate_txt">&pound;{$special_tickets[i].ticket_price}</span></div>
														{/section}
														<div class="ultimate_ticket_child1_nd1"> <span class="ultimate_txt_new">Charter per hour:</span></div>
														<div class="ultimate_ticket_child2_nd1"><span class="ultimate_txt_new">&pound;{$tour.tour_charter_price}</span></div>
														
														</div>
														<div class="ultimate2_main2">
														  <a href="booking.php?tour_id={$tour_id}&amp;subpage=step1" title="Book Online"><img src="images/book_online_btn_pak_nd1.jpg" alt="Book Online" border="0" title="Book Online" /></a> </div>
														</div>
													   </div>
														<div class="ultimate_bottom1"></div>
													</div>
                                                  {if $tour.tour_name ne 'JINGLE BELL BLAST'}
                                                  {if $tour.tour_name ne 'The Ultimate London Adventure (50 minutes)'} 
                                                  {if $tour.tour_name ne 'Captain Kidd's Canary Wharf Voyage (50 minutes)'} 
                                                   
													<div class="review_1">
														<div class="voucher_bg_nd1">
														<div class="white_txt">Gift Vouchers: </div>
													<div class="ultimate2_main">
													  <div class="purchase2_main2">
                                                      <a href="booking.php?tour_id={$tour_id}&amp;voucher_id={$vouchers[0].voucher_id}&amp;subpage=tours" title="Purchase Online">
                                                      <img src="images/purchase_nd1.jpg" alt="Purchase Online" width="87" height="86" border="0" title="Purchase Online" /></a>
                                                      </div>
                                                      
<!-- div class="purchase2_main2"><a href="booking.php?tour_id={$tour_id}&amp;voucher_id={$vouchers[0].voucher_id}&amp;subpage=voucher_details" title="Purchase Online"><img src="images/purchase_nd1.jpg" alt="Purchase Online" width="87" height="86" border="0" title="Purchase Online" /></a></div-->                                                      
													</div>
														</div>
														</div>
                                                       {/if}
                                                       {/if}
                                                       {/if}
											    </div>
											  </div>