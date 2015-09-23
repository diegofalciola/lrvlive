<footer>
    {if $error == 'expired' }
        <p class="msj error" style="display: block"><span class="icon">Session expired</p>
    {/if}
    {if $error == 'nodata' }
        <p class="msj error" style="display: block"><span class="icon">No data received</p>
    {/if}
    {if $error == 'busy' }
        <p class="msj error" style="display: block"><span class="icon">Sorry, the trip is full, try again.</p>
    {/if}
    <div class="grid">
        {if $subpage==_step1}
            {if $mobile==y}
                <div class="col-1-3"><a href="#" id="prev" class="btn md-close btn-secondary" onclick="javascript:$(window.close())"> Close </a></div>
                {else}
            <div class="col-1-3"><a href="#" id="prev" class="btn md-close btn-secondary" onclick="javascript:$(window.parent.document.querySelector('.md-overlay')).click();"> Close </a></div>
                {/if}
        {else}
            <div class="col-1-3"><a href="javascript:history.back()" id="prev" class="btn md-close btn-secondary"> Back </a></div>
        {/if}

        <div class="col-1-3"><p class="price-total"><span>&pound;</span><span id="tot_price" class="number">{$order.order_total}</span></p></div>
        <div class="col-1-3"><a href="javascript:check_form();" id="next" class="btn btn-main" > Next </a></div>
        <!--<input type="submit" class="btn btn-main" value="Next">-->
    </div>
</footer>

<input type="hidden" name="price_fee" value="{$price_fee}" id="price_fee" />

</section>
</body>


{if $subpage=="_step2"}
    <script>
        var times = [];
        var departures = [];
        var visible = true;
        var sid = {$sessionId[0]};
        departures = {$departures};
//console.log(departures);
        var availableDates = {$availableDates};
    </script>
    <script src="js/plugins/jquery.datetimepicker.js"></script>

{literal}
        <script>

        if (departures.length == 0){
            visible = false;
        }
        function addZero(i) {
            if (i < 10) {
                i = "0" + i;
            }
            return i;
        }
            var selectedTime = function (selectedDeparture) {
                $('#selected_departure').val(selectedDeparture);
            }

            var logic = function( givenTime ){
                //console.log(givenTime);
                //console.log(givenTime.getMonth());
                date = givenTime.getFullYear() + '-' +  addZero(givenTime.getMonth() + 1) + '-' + addZero(givenTime.getDate());
                $('#selected_date').val(date);
                var picker = this;
                sid = $('#order_id').val();
                tour_id = $('#tour_id').val();
                var data = {
                    'selectDate' : date,
                    'sid': sid,
                    'tour_id': tour_id
                };

                $.getJSON( "departure_time.php", data, function( response ) {
                    departures = response;
                    //times = [];
                    //$.each( response, function( key, val ) {
                    //    times.push(val.departure_time);
                    //} );
                     if (departures.length == 0){
                         picker.setOptions({
                             timepicker: false
                         });
                    } else {
                         picker.setOptions({
                             allowTimes: departures,
                             timepicker: true
                         });
                     }
                    $('#selected_departure').val('');
                    //jQuery(this).find('.xdsoft_current').removeClass('xdsoft_current');
                    //console.log(times)
                } );

            };
        </script>

        <script type="text/javascript">
            var tomorrow = new Date(new Date().getTime() + 24 * 60 * 60 * 1000);

            $('#datetimepicker3').datetimepicker( {
                onGenerate:function( ct ){
//                    var dates = jQuery(this).find('.xdsoft_date');
//                    dates.addClass('xdsoft_disabled');
//
//                    $(dates).each(function(){
//                        var date =  $(this).attr('data-year') + "-" +
//                                    ($(this).attr('data-month')<10? '0'+$(this).attr('data-month'):''+$(this).attr('data-month'))  + "-" +
//                                    ($(this).attr('data-date')<10? '0'+$(this).attr('data-date'):''+$(this).attr('data-date'));
//
//                        if ($.inArray(date, availableDates)!= -1){
//                            $(this).toggleClass('xdsoft_disabled');
//                        }
//                    })

                    jQuery(this).find('.xdsoft_date')
                            .toggleClass('xdsoft_disabled');
                },
                inline:true,
                //format: "Y/m/d H:i",
                onSelectDate:logic,
                allowTimes: departures,
                onSelectTime: selectedTime,
                timepicker: visible,
                roundTime: 'floor',
                step: 1,
                disabledDates: availableDates,
                formatDate : 'Y-m-d'
            } );

        </script>

    {/literal}
{/if}
{literal}

    <script src="js/plugins.js"></script>
    <script src="js/main.js"></script>
    <script src="js/plugins/jquery.easing.1.3.js"></script>
    <script src="js/plugins/jquery.animate-enhanced.min.js"></script>
    <script src="js/plugins/jquery.superslides.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/plugins/modalEffects.js"></script>
    <script src="js/plugins/classie.js"></script>
        <!--<script type="text/javascript" src="slick/slick.min.js"></script>-->

    <script>


        $(function() {
            var header = $(".clearHeader");
            $(window).scroll(function() {
                var scroll = $(window).scrollTop();

                if (scroll >= 200) {
                    header.removeClass('clearHeader').addClass("darkHeader");
                } else {
                    header.removeClass("darkHeader").addClass('clearHeader');
                }
            });
            $('.dropdown-btn').on('click', function(e) {
                $('.select-trip-items').toggleClass("pressed");
                $('.dropdown-btn').toggleClass("pressed");
                e.preventDefault();
            });
            // Si clickear cualquier item del menu, oculpa el menu
            $('.md-trigger').on('click', function(e) {
                $('.select-trip-items').toggleClass("pressed");
                $('.dropdown-btn').toggleClass("pressed");
                e.preventDefault();
            });
        });
    </script>
    <!-- Google Analytics: change UA-XXXXX-X to be your site's ID. -->
    <script>
        (function(b,o,i,l,e,r){b.GoogleAnalyticsObject=l;b[l]||(b[l]=
                function(){(b[l].q=b[l].q||[]).push(arguments)});b[l].l=+new Date;
            e=o.createElement(i);r=o.getElementsByTagName(i)[0];
            e.src='//www.google-analytics.com/analytics.js';
            r.parentNode.insertBefore(e,r)}(window,document,'script','ga'));
        ga('create','UA-XXXXX-X','auto');ga('send','pageview');
    </script>
<script type="text/javascript">
    $(document).ready(function() {

        //logic(Date.now().getDate)
        var s = $(".facts-container");
        var pos = s.position();
        $(window).scroll(function() {
            var windowpos = $(window).scrollTop();

            if (windowpos >= pos.top) {
                s.addClass("stick");
            } else {
                s.removeClass("stick");
            }
        });
    });

    function calculate_total(){
        var total = 0;

        var ticketSelects = $("select[class*='ticket']");
        ticketSelects.each(function(){
            var select = $(this);
            var ticketPrice = select.attr('ticketPrice');
            var ticketCount = select.val();

            total += parseInt(ticketCount)*parseFloat(ticketPrice);
        })

        // Added by Carlos
        if (total != 0){
            total += parseFloat($("#price_fee").val());
        }

        //document.step1.total.value = Currency(total);


        document.getElementById("total").value = total;
        document.getElementById("tot_price").innerHTML = Currency(total);

    }

</script>
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
</html>


