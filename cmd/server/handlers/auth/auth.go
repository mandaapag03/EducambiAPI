package auth

import "github.com/gin-gonic/gin"

type AuthHandler interface {
	Register() gin.HandlerFunc
	Login() gin.HandlerFunc
	Logout() gin.HandlerFunc
	Update() gin.HandlerFunc
}
