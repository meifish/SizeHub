package src.auth

import com.google.firebase.auth.FirebaseAuth
import com.google.firebase.auth.FirebaseAuthException

class FirebaseAuthService : AuthService {

    override fun validateToken(token: String): String?{
        return try{
            FirebaseAuth.getInstance().verifyIdToken(token).email
        }
        catch (e: FirebaseAuthException){ null }
    }
}