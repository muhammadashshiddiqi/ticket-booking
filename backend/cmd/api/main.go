package main

import (
	//"ticket-booking-app/config"
	"ticket-booking-app/handlers"
	"ticket-booking-app/repositories"

	"github.com/gofiber/fiber/v2"
)

func main()  {
	//envConf := config.NewEnvConfig()
	
	app := fiber.New(fiber.Config{
		AppName: "Ticket Booking App",
		ServerHeader: "Fiber v2",
	})

	//repositories
	eventRepo := repositories.NewEventRepository(nil)

	//routing
	server := app.Group("/api")

	//handlers
	handlers.NewEventHandler(server.Group("/event"), eventRepo)

	app.Listen(":3333")
}