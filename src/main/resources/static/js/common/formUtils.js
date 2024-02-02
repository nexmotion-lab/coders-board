function checkWriteInput(maxLength){

    let encoder = new TextEncoder('utf-8');
    let postTitle = $('#postTitle').val();
    let postContent = editor.getData();

    if(postTitle.trim() === ""){
        alert('제목을 입력하여 주십시오.');
        setFocus('#postTitle');
        return false;
    }

    if(encoder.encode(postTitle).length > maxLength){
        alert('제한된 길이를 넘었습니다. 제목을 다시 입력하여 주십시오.');
        setFocus('#postTitle');
        return false;
    }

    if(postContent.trim() === ""){
        alert('길이 제한을 초과했습니다. 제목을 다시 입력해 주십시오.');
        setFocus('#postContent');
        return false;
    }
    return true;

}

// CKeditor 초기화의 비동기 특성에 대해 완전한 초기화 이후에 포커스가 실행되도록 설정
function setFocus(selector){
    setTimeout(()=>{
        $(selector).focus();
    }, 0);
}