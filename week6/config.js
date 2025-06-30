let rootPath = "https://sysite.itvarsity.org/api/contactBook/";
let apiKey = checkApiKey();


function checkApiKey() {
    if (!localStorage.getItem("apikey")){
        window.open("enter-api-key.htal", "-self");
    }
    return localStorage.getItem("apikey");
}