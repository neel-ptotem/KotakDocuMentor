var presentationCycle = {
    
    /*
     * Presentation Cycle - a jQuery Cycle extension
     * Author:  Gaya Kessler
     * URL:     http://www.gayadesign.com
     * Date:	03-11-09
     */
    
    //slide options
    slideTimeout: 8000,
    containerId: "presentation_container",
    
    //cycle options
    cycleFx: 'scrollHorz',
    cycleSpeed: 600,  
    
    //progressbar options
    barHeight: 14,
    barDisplacement: 20,
    barImgLeft: "/assets/pslidecss/cycler-pSlide_Images/pc_item_left.gif",
    barImgRight: "/assets/pslidecss/cycler-pSlide_Images/pc_item_right.gif",
    barImgCenter: "/assets/pslidecss/cycler-pSlide_Images/pc_item_center.gif",
    barImgBarEmpty: "/assets/pslidecss/cycler-pSlide_Images/pc_bar_empty.gif",
    barImgBarFull: "/assets/pslidecss/cycler-pSlide_Images/pc_bar_full.gif",
    
    //variables this script need
    itemCount: 0,
    currentItem: 0,
    itemBarWidth: 0,
    barContainer: "",
    barContainerActive: "",
    barContainerOverflow: "",
    disableAnimation: false,
    
    init: function() {
        
        presentationCycle.itemCount = $('#' + presentationCycle.containerId).children().length;

        presentationCycle.barContainer = $("<div></div>");
        $(presentationCycle.barContainer).addClass("pc_bar_container");
        
        var subtrackSpace = (presentationCycle.itemCount * presentationCycle.barHeight);
        var totalWidth = $('#' + presentationCycle.containerId).innerWidth() - presentationCycle.barDisplacement;
        var fillWidth = Math.floor((totalWidth - subtrackSpace) / (presentationCycle.itemCount - 1));
        presentationCycle.itemBarWidth = fillWidth;
        
        for (var i = 0; i < presentationCycle.itemCount; i++) {
            var item = $("<div>&nbsp;</div>").appendTo(presentationCycle.barContainer);
            var extra_bar = true;
            if (i == 0) {
                $(item).addClass("left");
                $(item).css({
                    backgroundImage: "url(" + presentationCycle.barImgLeft + ")",
                    height: presentationCycle.barHeight + "px",
                    width: presentationCycle.barHeight + "px"
                });
            } else if (i == (presentationCycle.itemCount - 1)) {
                $(item).addClass("right");
                $(item).css({
                    backgroundImage: "url(" + presentationCycle.barImgRight + ")",
                    height: presentationCycle.barHeight + "px",
                    width: presentationCycle.barHeight + "px"
                });
                extra_bar = false;
            } else {
                $(item).addClass("center");
                $(item).css({
                    backgroundImage: "url(" + presentationCycle.barImgCenter + ")",
                    height: presentationCycle.barHeight + "px",
                    width: presentationCycle.barHeight + "px"
                });
            }
            $(item).attr('itemNr', (i + 1));
            $(item).css('cursor', 'pointer');
            $(item).click(function() {
               presentationCycle.gotoSlide($(this).attr('itemNr'));
            });
            
            if (extra_bar == true) {
                var item = $("<div>&nbsp;</div>").appendTo(presentationCycle.barContainer);
                $(item).addClass("bar");
                 $(item).css({
                    backgroundImage: "url(" + presentationCycle.barImgBarEmpty + ")",
                    height: presentationCycle.barHeight + "px",
                    width: fillWidth + "px"
                });
            }
        }
        
        var overflow = $("<div></div>");
        $(overflow).addClass("pc_bar_container_overflow");
        $(overflow).css({
            overflow: "hidden",
            width: totalWidth + "px"
        });
        var underflow = $("<div></div>");
        $(underflow).addClass("pc_bar_container_underflow").appendTo(overflow);
        
        presentationCycle.barContainerActive = $(presentationCycle.barContainer).clone().appendTo(underflow);
        $(presentationCycle.barContainerActive).removeClass("pc_bar_container");
        $(presentationCycle.barContainerActive).children().each(function () {
            $(this).css({
                backgroundPosition: "right"
            });
            if ($(this).css("background-image").match(presentationCycle.barImgBarEmpty)) {
                var newImg = $(this).css("background-image").replace(presentationCycle.barImgBarEmpty, presentationCycle.barImgBarFull);
                $(this).css("background-image", newImg);
            }
        });
        $(overflow).css({
            width: presentationCycle.barHeight + "px",
            height: presentationCycle.barHeight + "px"
        });
        
        presentationCycle.barContainerOverflow = overflow;
        
        $('#' + presentationCycle.containerId).cycle({
    		fx: presentationCycle.cycleFx,
            speed: presentationCycle.cycleSpeed,
            timeout: presentationCycle.slideTimeout,
            before: function(currSlideElement, nextSlideElement) { presentationCycle.beforeSlide(currSlideElement, nextSlideElement); }
    	});
        
        presentationCycle.barContainer.appendTo($('#' + presentationCycle.containerId));
        overflow.appendTo($('#' + presentationCycle.containerId));
        
        var i = 0;
        $(".pc_bar_container_overflow .left, .pc_bar_container_overflow .center, .pc_bar_container_overflow .right").each(function () {
            $(this).attr('itemNr', (i + 1));
            $(this).css('cursor', 'pointer');
            $(this).click(function() {
                presentationCycle.gotoSlide($(this).attr('itemNr'));
            });
            i++;
        });
    },
    
    beforeSlide: function(currSlideElement, nextSlideElement) {
        if (presentationCycle.currentItem == 0) {
            presentationCycle.currentItem = 1;
        } else {
            presentationCycle.currentItem = (presentationCycle.itemCount - ($(nextSlideElement).nextAll().length)) + 2;
        }
        presentationCycle.animateProcess();
    },
    
    animateProcess: function() {
        var startWidth = (presentationCycle.itemBarWidth * (presentationCycle.currentItem - 1)) + (presentationCycle.barHeight * presentationCycle.currentItem);
        if (presentationCycle.currentItem != presentationCycle.itemCount) {
            var newWidth = (presentationCycle.itemBarWidth * (presentationCycle.currentItem)) + (presentationCycle.barHeight * (presentationCycle.currentItem + 1));   
        } else {
            var newWidth = presentationCycle.barHeight;
        }
        
        $(presentationCycle.barContainerOverflow).css({
            width: startWidth + "px"
        });
        if (presentationCycle.disableAnimation == false) {
            $(presentationCycle.barContainerOverflow).stop().animate({
                width: newWidth + "px"
            }, (presentationCycle.slideTimeout - 100));   
        }
    },
    
    gotoSlide: function(itemNr) {
        $(presentationCycle.barContainerOverflow).stop();
        presentationCycle.disableAnimation = true;
        $('#' + presentationCycle.containerId).cycle((itemNr - 1));
        $('#' + presentationCycle.containerId).cycle('pause');
    }
    
}