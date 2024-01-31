package libraryapp

class UserController {
    
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    
    def login() {
        def userName=params?.userName
        def passWord=params?.passWord
        def encryptedPassWord=getEncryp(passWord)
        def userDetail=User?.findByUserName(userName)
        if(userDetail && userDetail.passWord==encryptedPassWord)
        {
            session.userRole=userDetail.role
            session.userId=userDetail.id
            render(view: 'dashboard')
        }
        else{
            flash.error = "Invalid credentials"
            render(view: "home")
        }
    }

    def dash(){
        render(view: 'dashboard')
    }

    static String getEncryp(String input) {
    def encryp = ""
    for(int i=0; i<input.length(); i++) {
        encryp += (char)((int)input.charAt(i) + (i+1) * 5)
    }
    return encryp
    }
}