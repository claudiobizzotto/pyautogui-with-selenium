$(document).mousemove(function(event){
    xdiff = $("#image").width() / 2;
    ydiff = $("#image").height() / 2;

    $("#image").css({
        left: event.pageX - xdiff,
        top: event.pageY - ydiff
    });

    $("#coordinate_x").html("X = " + event.pageX)
    $("#coordinate_y").html("Y = " + event.pageY)
});

$(document).ready(function() {
    $("#change-me-paw").click(function() {
        var newPaw = ($("#image").attr("src") === 'paw1.png') ? "paw2.png" : "paw1.png";
        $("#image").attr("src", newPaw);
        console.log("How do you like me paw now?");
    });
});
