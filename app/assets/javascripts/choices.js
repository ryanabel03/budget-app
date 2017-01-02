function choiceListener() {
  $(".choice").on("click", function(e) {
    $(".choice").css("background-color", "white");
    $(".choice").css("color", "black");
    var choice = $(e.target).closest(".choice");
    choice.css("background-color", "#009999");
    choice.css("color", "white");
  });
}
