$(document).ready(function () {
    let postId = getPostId();
    console.log(111, postId)
    loadData(postId);
});

function loadData(postId) {
    // Ajax를 통해 서버에서 데이터 가져오기
    $.ajax({
        url: '/attach/details/select',
        type: 'GET',
        data: {postId: postId},
        dataType: 'json',
        success: function (response) {
            if (response.returnCode === "200") {
                let post = response.data;
                console.log(post)
                // 가져온 데이터로 페이지 채우기
                fillPage(post);
            } else {
                alert('상세보기 데이터 가져오기 실패');
            }
        },
        error: function () {
            alert('서버와의 통신 중 오류가 발생했습니다.');
        }
    });
}

function fillPage(post) {
    // 가져온 데이터로 페이지를 동적으로 채우는 코드
    var postDetailHtml =
        '<div class="border-bottom border-2 p-3">' +
        '<div class="fw-bold h4">' + post.postTitle + '</div>' +
        '<div class="text-secondary">' + post.postDate + ' | 조회수 ' + post.postHit + ' | ' + post.postAuthor + '</div>' +
        '</div>' +
        '<div class="p-3" style="">' + post.postContent + '</div>';
    $('#postDetail').html(postDetailHtml);
}

// URL에서 특정 파라미터의 값을 가져오는 함수
function getPostId() {
    let postId = window.location.pathname.split('/').pop();
    return postId;
}

function getPrevPost() {
    let postId = getPostId();
    let prevUrl = '/attach/details/' + (postId - 1);
    window.location.href = prevUrl;
}

function getNextPost() {
    let postId = getPostId();
    let nextUrl = '/attach/details/' + (postId + 1);
    window.location.href = nextUrl;
}