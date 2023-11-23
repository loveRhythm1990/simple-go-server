package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"io"
	"net/http"
)

func addRouter(r *gin.Engine) {
	r.GET("/health", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"message": "ok",
		})
	})

	r.POST("/hook", func(c *gin.Context) {

		data, err := io.ReadAll(c.Request.Body)
		must(err)

		fmt.Fprintf(gin.DefaultWriter, neat(string(data)))
		fmt.Fprintf(gin.DefaultWriter, "\n")

		c.JSON(http.StatusOK, gin.H{
			"message": "ok",
		})
	})
}

func main() {
	r := gin.Default()
	addRouter(r)
	must(r.Run(":8080"))
}
