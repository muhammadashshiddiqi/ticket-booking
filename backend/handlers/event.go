package handlers

import (
	"context"
	"ticket-booking-app/models"
	"time"

	"github.com/gofiber/fiber/v2"
)

type EventHandler struct {
	repository models.EventRepository
}

func (h *EventHandler) GetListTickets(ctx *fiber.Ctx) error  {
	context, cancel := context.WithTimeout(context.Background(), time.Duration(5*time.Second))
	defer cancel()

	event, err := h.repository.GetMany(context)

	if err != nil {

		return ctx.Status(fiber.StatusBadGateway).JSON(&fiber.Map{
			"status": "failed",
			"message": err.Error(),
		})
	}

	return ctx.Status(fiber.StatusOK).JSON(&fiber.Map{
		"status": "success",
		"message": "successfully get data",
		"data": event,
	})
}


func NewEventHandler(router fiber.Router, repo models.EventRepository){
	handlers := &EventHandler {
		repository: repo,
	}

	router.Get("/" , handlers.GetListTickets)
}