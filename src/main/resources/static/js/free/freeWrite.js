function submitForm() {
    console.log("submitForm() 실행");
    var postTitle = $("#postTitle").val();
    var postContent = $("#postContent").val();

    console.log("title, content : " + postTitle + ", " + postContent);

    $.ajax({
        url: '/free/insert',
        type: 'POST',
        data: { postTitle: postTitle, postContent: postContent },
        dataType: 'json',
        success: function (response) {
            if(response.returnCode === "200") {
                alert('게시글이 성공적으로 등록되었습니다.');
            } else
                alert('게시글을 등록하지 못했습니다.')
        },
        error: function () {
            alert('서버와의 통신 중 오류가 발생했습니다.');
        }
    })
}