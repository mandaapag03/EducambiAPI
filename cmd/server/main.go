package main

import "github.com/gin-gonic/gin"

func main() {
	eng := gin.Default()

	// Define os proxies confiáveis
	// Use []string{"0.0.0.0/0"} para confiar em todos (não recomendado em produção)
	// Ou especifique o IP/cidr exato do proxy (ex: "192.168.1.1" ou "10.0.0.0/8")
	err := eng.SetTrustedProxies([]string{"127.0.0.1", "189.33.123.82"})
	if err != nil {
		panic(err)
	}

	eng.GET("/ping", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "pong",
		})
	})

	if err := eng.Run(); err != nil {
		panic(err)
	}
}
