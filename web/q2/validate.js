function validateAdminForm() {
    var x = document.forms["adminform"]["username"].value;
    if (x.length >20) {
        alert("Maximum 20 characters in username");
        return false;
    }
    var sub;
    for (i = 0; i < x.length; i++) {
        sub = x.charCodeAt(i);
        if((sub<65 && sub!=32) || (sub>90 && sub<97) || sub>122){
            alert("Username not valid");
            return false;
        }
    }
    x = document.forms["adminform"]["psw"].value;
    if (x.length>=20) {
        alert("Password to long");
        return false;
    }
    for (i = 0; i < x.length; i++) {
        sub = x.charCodeAt(i);
        if(sub<48 || (sub>57 && sub<65) || (sub>90 && sub<97) || sub>122){
            alert("Invalid Password");
            return false;
        }
    }  
    
}

function validateForm() {
    var x = document.forms["myForm"]["name"].value;
    if (x.length >20) {
        alert("Maximum 20 characters in name");
        return false;
    }
    var sub;
    for (i = 0; i < x.length; i++) {
        sub = x.charCodeAt(i);
        if((sub<65 && sub!=32) || (sub>90 && sub<97) || sub>122){
            alert("Name not valid");
            return false;
        }
    }
    
    x = document.forms["myForm"]["address"].value;
    if (x.length >100) {
        alert("Maximum 100 characters in address");
        return false;
    }
    
    x = document.forms["myForm"]["email"].value;
    var flag=0;
    var cnt1=0, cnt2=0;
    for (i = 0; i < x.length; i++) {
        sub = x.charCodeAt(i);
        if(flag==0) {
            if(sub==64){
                flag=1;
            }
            else if(sub<65 || (sub>90 && sub<97) || sub>122){
                alert("email not valid");
                return false;
            }
            else{
                cnt1++;
            }
        }
        else if(flag==1){
            if(sub==46){
                flag=2;
            }
            else if(sub<65 || (sub>90 && sub<97) || sub>122){
                alert("email not valid");
                return false;
            }
            else{
                cnt2++;
            } 
        }
        else if(flag==2){
            if(sub!=99){
                alert("email not valid");
                return false;
            }
            flag=3;
        }
        else if(flag==3){
            if(sub!=111){
                alert("email not valid");
                return false;
            }
            flag=4;
        }
        else if(flag==4){
            if(sub!=109){
                alert("email not valid");
                return false;
            }
            flag=5;
        }
        else{
            alert("email not valid");
            return false;
        }
    }
    if(cnt1==0 || cnt2==0 || flag!=5){
        alert("email not valid");
        return false;
    }

    x = document.forms["myForm"]["mobile"].value;
    if (x.length!=10) {
        alert("Mobile number must be 10 digits long");                          // Handle Leading 0's
        return false;
    }
    if (x.charCodeAt(0)==48) {
        alert("No leading 0's in mobile no.");                          // Handle Leading 0's
        return false;
    }
    
    x = document.forms["myForm"]["account"].value;
    if (x.length!=5) {
        alert("Account number must be 5 digits long");
        return false;
    }
    
    x = document.forms["myForm"]["psw"].value;
    if (x.length>=20) {
        alert("Password to long");
        return false;
    }
    for (i = 0; i < x.length; i++) {
        sub = x.charCodeAt(i);
        if(sub<48 || (sub>57 && sub<65) || (sub>90 && sub<97) || sub>122){
            alert("Invalid Password");
            return false;
        }
    }  
}
 
