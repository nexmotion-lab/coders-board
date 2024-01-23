let attach = {};
$(document).ready(function () {
    console.log(123123, "jsp가 켜질때 실행");
    getBoardList();
});

function getBoardList() {
    console.log(222);
    $.ajax({
        url:"/attach/select",
        type:"GET",
        dataType:JSON,
        success:function (data) {
            let obj=JSON.parse(data);
            let array =["<ol>"];
            obj["attachList"].forEach(
            list => array.push("<li>"+postId+"</li>")
            );
            array.push("</ol>")

            $("#result").html(array.join(""));
        },
        error: function (request, status, error) {
            console.log(error)
        }
    });
}
