package main

import (
	"fmt"
	"ticket-booking-app/config"
	"ticket-booking-app/db"
	"ticket-booking-app/handlers"
	"ticket-booking-app/repositories"

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

	//routing
	server := app.Group("/api")

	//handlers
	handlers.NewEventHandler(server.Group("/event"), eventRepo)
	handlers.NewTicketHandler(server.Group("/ticket"), ticketRepo)

	app.Listen(fmt.Sprintf(":" + envConf.ServerPort))
}
