package main

import (
	"backend/cmd/server/routes"
	"github.com/gin-gonic/gin"
)

func main() {
	eng := gin.Default()

	router := routes.NewRoutes(eng, nil)
	router.MapRoutes()

	if err := eng.Run(); err != nil {
		panic(err)
	}
}
