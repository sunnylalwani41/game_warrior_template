let otp = document.getElementsByClassName("otp")[0];
document.getElementsByClassName("otpForm")[0].addEventListener("submit", (event)=>{
    event.preventDefault();

    submitOtp(otp.value);
    
});

let submitOtp= (otpValue)=>{
    $.ajax({
        url: "/verifyOtp",
        data:JSON.stringify({
            otp: otpValue
        }),
        contentType:"application/json",
        type: "post",
        dataType: "json",
        success: function(response){
            console.log(response);
            Swal.fire({ title: "Good job!", text: "Your OTP has been verified!", icon: "success"});
            window.location.href="../index.html"
        },
        error: function(error){
           console.log(error);
           Swal.fire({ title: "", text: "Invalid otp "+error.description, icon: "error"});
        }
    });
}