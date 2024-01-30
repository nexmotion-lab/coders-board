$(document).ready(function () {
    // 페이지 로드 시 URL에서 postId를 추출하여 loadData 함수 호출
    var postId = getPostId();
    upPostHit(postId);
    loadData(postId);
});

function loadData(postId) {
    // Ajax를 통해 서버에서 데이터 가져오기
    $.ajax({
        url: '/free/details/select',
        type: 'GET',
        data: {postId: postId},
        dataType: 'json',
        success: function (response) {
            if (response.returnCode === "200") {
                var post = response.data;
                // 가져온 데이터로 페이지 채우기
                fillPage(post);
            } else {
                alert('데이터 가져오기 실패');
            }
        },
        error: function () {
            alert('서버와의 통신 중 오류가 발생했습니다.');
        }
    });
}

function fillPage(post) {
    // 가져온 데이터로 페이지를 동적으로 채우는 코드
    var postDetailHtml = '<div class="border-bottom border-2 p-3">' +
        '<div class="fw-bold h4">' + post.postTitle + '</div>' +
        '<div class="text-secondary">' + post.postDate.replace('T', ' ') + ' | 조회수 ' + post.postHit + ' | ' + post.postAuthor + '</div>' +
        '</div>' +
        '<div class="p-3" style="height: 300px;">' + post.postContent + '</div>';
    $('#postDetail').html(postDetailHtml);
}

function upPostHit(postId) {
    $.ajax({
        url: '/free/update/postHit',
        type: 'POST',
        data: { postId: postId },
        dataType: 'json',
        success: function (response) {
            if(response.returnCode === '200') {
                console.log("조회수 증가 성공");
            } else {
                console.log("조회수 증가 안됨");
            }
        },
        error: function () {
            alert('서버와의 통신 중 오류가 발생했습니다.');
        }
    })
}

// URL에서 특정 파라미터의 값을 가져오는 함수
function getPostId() {
    var postId = window.location.pathname.split('/').pop();
    return postId;
}

function getPrevPost() {
    var postId = getPostId();
    var prevUrl = '/free/details/' + (parseInt(postId) - 1);
    window.location.href = prevUrl;
}

function getNextPost() {
    var postId = getPostId();
    var nextUrl = '/free/details/' + (parseInt(postId) + 1);
    window.location.href = nextUrl;
}