package main

import (
	"fmt"
	"ticket-booking-app/config"
	"ticket-booking-app/db"
	"ticket-booking-app/handlers"
	"ticket-booking-app/middlewares"
	"ticket-booking-app/repositories"
	"ticket-booking-app/services"

	"github.com/gofiber/fiber/v2"
)

func main() {
	envConf := config.NewEnvConfig()
	db := db.Init(envConf, db.DBMigrator)

	app := fiber.New(fiber.Config{
		AppName:      "Ticket Booking App",
		ServerHeader: "Fiber v2",
	})

	//repositories
	eventRepo := repositories.NewEventRepository(db)
	ticketRepo := repositories.NewTicketRepository(db)
	authRepo := repositories.NewAuthRepository(db)

	//service
	authService := services.NewAuthService(authRepo)
	
	//routing
	server := app.Group("/api")
	handlers.NewAuthHandler(server.Group("/auth"), authService)
	
	privateRoutes := server.Use(middlewares.AuthProtected(db))

	//handlers
	handlers.NewEventHandler(privateRoutes.Group("/event"), eventRepo)
	handlers.NewTicketHandler(privateRoutes.Group("/ticket"), ticketRepo)

	app.Listen(fmt.Sprintf(":" + envConf.ServerPort))
}
