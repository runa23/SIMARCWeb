$(function () {
    var txt1 = '<img id="imageFullScreen" src="../Images/ic_fullscreen_black_24dp.png" data-swap="../Images/ic_fullscreen_exit_black_24dp.png" data-toggle="tooltip" data-placement="left" title="Full/Exit Screen"    /> ';
    $("#FullScreenContainer").prepend(txt1);
});


$(document).ready(function () {
    $('#imageFullScreen').click(function (e) {
        var _this = $(this);
        var current = _this.attr("src");
        var swap = _this.attr("data-swap");
        _this.attr('src', swap).attr("data-swap", current);



        $('#FullScreenContainer').toggleClass('fullscreen');

        AdjustSize();

    });
});

function OnInit(s, e) {
    AdjustSize();
    document.getElementById("gridContainer").style.visibility = "";

}

function OnEndCallback(s, e) {
    AdjustSize();

}

function OnControlsInitialized(s, e) {
    ASPxClientUtils.AttachEventToElement(window, "resize", function (evt) {
        AdjustSize();
    });
}


function AdjustSize() {

    var height = document.documentElement.clientHeight - $('#gridView').position().top;
    grid.SetHeight(height);

}