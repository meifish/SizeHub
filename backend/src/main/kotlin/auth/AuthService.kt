package src.auth

interface AuthService {

    fun validateToken(token: String): String?
}