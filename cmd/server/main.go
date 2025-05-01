package main

import (
	"github.com/gin-gonic/gin"
	"github.com/joho/godotenv"
	"log"
	"os"
)

func init() {
	err := godotenv.Load()
	if err != nil {
		log.Fatal("Error loading .env file")
	}
}

func main() {
	eng := gin.Default()

	// Define os proxies confiáveis
	// Use []string{"0.0.0.0/0"} para confiar em todos (não recomendado em produção)
	// Ou especifique o IP/cidr exato do proxy (ex: "192.168.1.1" ou "10.0.0.0/8")
	err := eng.SetTrustedProxies([]string{"0.0.0.0/0"})
	if err != nil {
		panic(err)
	}

	eng.GET("/ping", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "pong",
		})
	})

	if err := eng.Run(os.Getenv("PORT")); err != nil {
		panic(err)
	}
}
