function ifChar_Num(c) {
    console.log("ifchar_Num function called");
    switch( c){
        case '1': return true;
        case '2': return true;
        case '3': return true;
        case '4': return true;
        case '5': return true;
        case '6': return true;
        case '7': return true;
        case '8': return true;
        case '9': return true;
        case '0': return true;
        default: return false;
    }
}

function nameValidate(source, arguments) {
    var str = arguments.Value;
    console.log("Checking validations for " + str)
    

    for (var i = 0; i < str.length; i++) {
        if (ifChar_Num(str[i])) {
            arguments.IsValid = false;
            return false;
        }
        else {
            continue
        }
    }
    return true;
}

function isEmail(source, arguments) {
    var str = arguments.Value.toLowerCase();
    if (str.endsWith("@gmail.com") | str.endsWith("@yahoo.com"))
    {
        arguments.IsValid = true;
    }
    else {
        arguments.IsValid = false;
    }
}