// JavaScript Document

/*jQuery(document).ready(function () { 
                             if(jQuery(window).width()<800){
					jQuery('.dashboardWidget').attr('data-sizex','');
					jQuery('.dashboardWidget').attr('data-row','');
				}
			jQuery(window).resize(function() {
                             var doc_width = jQuery(this).width(); 
                             if(doc_width<800){
					jQuery('.dashboardWidget').attr('data-sizex','');
					jQuery('.dashboardWidget').attr('data-row','');
				}
			});
});*/


$(document).ready(function(e) {
	
	//toggle jquery work by nipun for calendar at 25-3-2015
	
	
	
    $(".mobile-toggle-bt").click(function(){
    //alert("The paragraph was clicked.");
		$(".mobile-toggle-mm").toggle();
	});
	
	if($(window).width()<767){
	$(".mobile-toggle-mm a").click(function(){
    //alert("The paragraph was clicked.");
		$(".mobile-toggle-mm").hide();
	});
	
	}
	
	if($(window).width()<767){
	
	$("li.dashboardWidget").removeClass("gs_w");
	
	}
	
	jQuery(window).resize(function() {
                             var doc_width = jQuery(this).width(); 
                             if(doc_width<800){
								$(".mobile-toggle-mm a").click(function(){
								//alert("The paragraph was clicked.");
									$(".mobile-toggle-mm").hide();
								});
							 }
						
						});	
});