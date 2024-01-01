document.getElementsByClassName("livechat_float").addEventListener("onclick", ()=>{
    $.ajax({
        type:"GET",
        url: "liveChat",
        success: function(data){
            console.log(data);
        },
        error: function(){

        }
    })
})