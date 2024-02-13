// 에디터 객체를 전역 변수로 선언
let editor;
let postId;

// 문서가 로드된 후에 실행될 함수
$(document).ready(function () {
    //postId를 받아옴
    postId = getPostId();

    // 에디터를 초기화하고 에디터 객체를 전역 변수에 저장
    ClassicEditor
        .create(document.querySelector('#postContent'))
        .then(instance => {
            editor = instance;
            loadData(postId);

        })
        .catch(error => {
            console.error('에디터 초기화 중 오류 발생:', error);
        });
});

function getPostId() {
    return window.location.pathname.split('/').pop();
}

// Ajax 제출 함수
function submitUpdate() {
    // 에디터에서 작성한 내용 가져오기

    let maxLength = 256;

    if(!checkWriteInput(maxLength)){
        return;
    }

    let postTitle = $('#postTitle').val();
    let postContent = editor.getData();

    $.ajax({
        url: '/notice/update',
        type: 'POST',
        data: { postId: postId, postTitle: postTitle, postContent: postContent },
        dataType: 'json',
        success: function (response) {
            if (response.returnCode === "200") {
                alert('게시글이 성공적으로 수정되었습니다.');
            } else
                alert('게시글을 수정하지 못했습니다.')
        },
        error: function () {
            alert('서버와의 통신 중 오류가 발생했습니다.');
        }
    });
    window.location.href = "/notice";
}

function loadData(postId) {
    // Ajax를 통해 서버에서 데이터 가져오기
    $.ajax({
        url: '/notice/details/select',
        type: 'GET',
        data: {postId: postId},
        dataType: 'json',
        success: function (response) {
            if (response.returnCode === "200") {
                let post = response.data;
                // postTitle 초기화
                $("#postTitle").val(post.postTitle);
                //postContent 초기화
                if(editor){
                    editor.setData(post.postContent);
                } else{
                    console.error('에디터 객체 사용 불가')
                }
            } else {
                alert('상세보기 데이터 가져오기 실패');
            }
        },
        error: function () {
            alert('서버와의 통신 중 오류가 발생했습니다.');
        }
    });
}