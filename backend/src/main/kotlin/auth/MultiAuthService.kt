package src.auth

class MultiAuthService(private val services: List<AuthService>) : AuthService {

    override fun validateToken(token: String): String? {
        services.forEach {
            it.validateToken(token)?.let { email -> return email }
        }
        return null
    }
}