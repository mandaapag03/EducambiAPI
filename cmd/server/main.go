package main

import "github.com/gin-gonic/gin"

func main() {
	eng := gin.Default()

	eng.GET("/ping", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "pong",
		})
	})

	if err := eng.Run(":8080"); err != nil {
		panic(err)
	}
}
