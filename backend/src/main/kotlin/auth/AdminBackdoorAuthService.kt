package src.auth

class AdminBackdoorAuthService : AuthService {

    override fun validateToken(token: String): String? {
        if(token.startsWith("admin-")){
            return token.split(Regex("-"), 2)[1]
        }
        return null
    }
}