// function submitForm() {
//     console.log("submitForm() 실행");
//     var postTitle = $("#postTitle").val();
//     var postContent = $("#postContent").val();
//
//     console.log("title, content : " + postTitle + ", " + postContent);
//
//     $.ajax({
//         url: '/free/insert',
//         type: 'POST',
//         data: { postTitle: postTitle, postContent: postContent },
//         dataType: 'json',
//         success: function (response) {
//             if(response.returnCode === "200") {
//                 alert('게시글이 성공적으로 등록되었습니다.');
//             } else
//                 alert('게시글을 등록하지 못했습니다.')
//         },
//         error: function () {
//             alert('서버와의 통신 중 오류가 발생했습니다.');
//         }
//     })
// }

// 에디터 객체를 전역 변수로 선언
let editor;

// 문서가 로드된 후에 실행될 함수
$(document).ready(function () {
    // 에디터를 초기화하고 에디터 객체를 전역 변수에 저장
    ClassicEditor
        .create(document.querySelector('#postContent'))
        .then(instance => {
            editor = instance;
        })
        .catch(error => {
            console.error('에디터 초기화 중 오류 발생:', error);
        });
});

// Ajax 제출 함수
function submitForm() {
    // 에디터에서 작성한 내용 가져오기
    let postTitle = $("#postTitle").val();
    let postContent = editor.getData();

    $.ajax({
        url: '/free/insert',
        type: 'POST',
        data: { postTitle: postTitle, postContent: postContent },
        dataType: 'json',
        success: function (response) {
            if (response.returnCode === "200") {
                alert('게시글이 성공적으로 등록되었습니다.');
            } else
                alert('게시글을 등록하지 못했습니다.')
        },
        error: function () {
            alert('서버와의 통신 중 오류가 발생했습니다.');
        }
    });
    window.location.href = "/free";
}