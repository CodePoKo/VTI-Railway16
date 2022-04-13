 // alert("Hello world!");
        // document.write("Hello World!");
        // console.log("Hello World!");
        // confirm("Bạn có đồng ý không?");
        function myFunction() {
            // alert("Bây giờ là: " + new Date().getHours() + " giờ " + new Date().getMinutes() + " phút")
            
            var myObject = {
                Name: "VTI Academy",
                Gender: "Male",
                Email: "vtiacademy@vti.com.vn",
            }
            document.getElementById("demo").innerHTML = "Name: " + myObject.Name + 
            "<br>Gender: " + myObject.Gender + "<br>Email: " + myObject.Email
        }
// Ex4 Question10, Ex8 Question1
var num1 = document.querySelector(".number1");
var num2 = document.querySelector(".number2");
var result = document.querySelector(".result");

function tong() {
    result.value = Number(num1.value) + Number(num2.value);
}
function hieu() {
    result.value = Number(num1.value) - Number(num2.value);
}
function tich() {
    result.value = Number(num1.value) * Number(num2.value);
}
function thuong() {
    result.value = Number(num1.value) / Number(num2.value);
}
function chiadu() {
    result.value = Number(num1.value) % Number(num2.value);
}

// Ex8 Question2
var calc = document.querySelector(".calc");
var dai1 = document.querySelector(".dai1");
var dai2 = document.querySelector(".dai2");
var chuvi = document.querySelector(".chuvi");
var dientich = document.querySelector(".dientich");

calc.onclick = function() {
    chuvi.value = (Number(dai1.value) + Number(dai2.value))*2;
    dientich.value = Number(dai1.value)*Number(dai2.value);
}

// Ex8.Question3
var soA = document.querySelector(".soA");
var soB = document.querySelector(".soB");
var soC = document.querySelector(".soC");
var giaiPT = document.querySelector(".giaiPT");
var ketquaPT = document.querySelector(".ketquaPT");

giaiPT.onclick = function() {
    var nghiem = Math.pow(soB.value,2) - 4*soA.value*soC.value;
    if(nghiem < 0) {
        ketquaPT.value = "Phương trình vô nghiệm";
    } else if(nghiem == 0) {
        ketquaPT.value = "Phương trình có nghiệm kép: " +
        "x1 = x2 = " + Number(-soB.value)/(2*Number(soA.value));
    } else {
        ketquaPT.value = "Phương trình có 2 nghiệm phân biệt " + "x1 = " + Number(-soB.value + Math.sqrt(nghiem))/(2*soA.value) 
        + " và " + "x2 = " + Number(-soB.value - Math.sqrt(nghiem))/(2*soA.value);
    }
}



// Ex8 Question4
var so1 = document.querySelector(".so1");
var so2 = document.querySelector(".so2");
var select =document.getElementById("selectNum");
var run = document.querySelector(".run");
var ketqua = document.querySelector(".ketqua");

run.onclick = function() {
    if(select.value == "add") {
        ketqua.value = Number(so1.value) + Number(so2.value)
    } else if(select.value == "sub") {
        ketqua.value = Number(so1.value) - Number(so2.value)
        
    } else if(select.value == "multipy") {
        ketqua.value = Number(so1.value) * Number(so2.value)
    } else if(select.value == "divide") {
        if(Number(so2.value) == 0) {
            alert("Không thể chia cho 0");
            ketqua.value = "";
        } else {
            ketqua.value = Number(so1.value) / Number(so2.value)
        }
    } else {
        ketqua.value = Number(so1.value) * Number(so2.value)
    }
}

// Ex8 Question6
var hoten = document.getElementById("name");
var sdt = document.getElementById("phonenumber");
var checkboxGender = document.getElementsByName("gender");
var checkboxSoThich = document.getElementsByName("sothich");
var hienthi = document.getElementById("hienthi");

hienthi.onclick = function() {
    var result1 = "";
    var result2 = "";
    for (var i = 0; i < checkboxGender.length; i++){
        if (checkboxGender[i].checked == true){
            result1 += checkboxGender[i].value;
        } 
    }
    for (var i = 0; i < checkboxSoThich.length; i++){
        if (checkboxSoThich[i].checked == true){
            result2 += checkboxSoThich[i].value;
        } 
    }
    alert("Họ tên: " + hoten.value
            + " SĐT: " + sdt.value
            + " Giới tính: " + result1
            + " Sở thích: " + result2);
}

// Question7