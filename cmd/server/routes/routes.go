package routes

import (
	"database/sql"
	"github.com/gin-gonic/gin"
)

const (
	// HealthCheckRoute is the route for the health check handler
	PingRoute = "/ping"

	// AuthRoute is the route for the auth handler
	PostAuthRegister = "/auth/register"
	PostAuthLogin    = "/auth/login"
	PostAuthLogout   = "/auth/logout"
	PatchAuthUpdate  = "/auth/update"
)

type Router interface {
	MapRoutes()
}

type router struct {
	eng         *gin.Engine
	routerGroup *gin.RouterGroup
	sqlDB       *sql.DB
	//middleware *middleware.Middleware
}

func NewRoutes(eng *gin.Engine, sqlDB *sql.DB) Router {
	return &router{eng: eng, sqlDB: sqlDB}
}

func (r *router) setGroup() {
	r.routerGroup = r.eng.Group("/api/v1")
}

func (r *router) MapRoutes() {
	r.setGroup()

	r.authRoutes()

	r.routerGroup.GET(PingRoute, r.healthCheckRoute)
}

func (r *router) authRoutes() {
	//r.routerGroup.Use(r.middleware.AuthMiddleware()){
	//}

	//r.routerGroup.POST(PostAuthRegister, r.authHandler.Register)
	//r.routerGroup.POST(PostAuthLogin, r.authHandler.Login)
	//r.routerGroup.POST(PostAuthLogout, r.authHandler.Logout)
	//r.routerGroup.PATCH(PatchAuthUpdate, r.authHandler.Update)
}

func (r *router) healthCheckRoute(c *gin.Context) {
	c.JSON(200, gin.H{
		"message": "pong",
	})
}
