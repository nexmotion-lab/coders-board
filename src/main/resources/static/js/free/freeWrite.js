$(document).ready(function() {
    // Submit 버튼 클릭 시 이벤트
    $("form").submit(function(event) {
        // 기본 동작 중단
        event.preventDefault();

        // 제목과 내용 가져오기
        var postTitle = $("#title").val();
        var postContent = $("#content").val();

        // API로 전송할 데이터
        var postData = {
            postTitle: postTitle,
            postContent: postContent,
            postAuthor: null,
            postId: null
        };

        // AJAX를 이용한 비동기 요청
        $.ajax({
            type: "POST",
            url: "/free/insert", // 실제 API 엔드포인트로 변경
            data: postData,
            success: function(response) {
                // 성공 시 동작
                console.log("API 요청 성공", response);
                // 원하는 동작 추가
            },
            error: function(error) {
                // 에러 시 동작
                console.error("API 요청 실패", error);
                // 원하는 동작 추가
            }
        });
    });
});