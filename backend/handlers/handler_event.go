package handlers

import (
	"context"
	"strconv"
	"ticket-booking-app/models"
	"time"

	"github.com/gofiber/fiber/v2"
)

type EventHandler struct {
	repository models.EventRepo
}

func (h *EventHandler) GetListEvent(ctx *fiber.Ctx) error {
	context, cancel := context.WithTimeout(context.Background(), time.Duration(5*time.Second))
	defer cancel()

	events, err := h.repository.RepoGetAllEvent(context)

	if err != nil {

		return ctx.Status(fiber.StatusBadGateway).JSON(&fiber.Map{
			"status":  "failed",
			"message": err.Error(),
			"data":    nil,
		})
	}

	return ctx.Status(fiber.StatusOK).JSON(&fiber.Map{
		"status":  "success",
		"message": "successfully get data",
		"data":    events,
	})
}

func (h *EventHandler) GetMyEvent(ctx *fiber.Ctx) error {
	eventId, _ := strconv.Atoi(ctx.Params("eventId"))

	context, cancel := context.WithTimeout(context.Background(), time.Duration(5*time.Second))
	defer cancel()

	event, err := h.repository.RepoGetEvent(context, uint(eventId))

	if err != nil {
		return ctx.Status(fiber.StatusBadRequest).JSON(&fiber.Map{
			"status":  "failed",
			"message": err.Error(),
			"data":    nil,
		})
	}

	return ctx.Status(fiber.StatusOK).JSON(&fiber.Map{
		"status":  "success",
		"message": "successfully your ticket",
		"data":    event,
	})
}

func (h *EventHandler) CreateEvent(ctx *fiber.Ctx) error {
	event := &models.Event{}
	context, cancel := context.WithTimeout(context.Background(), time.Duration(5*time.Second))
	defer cancel()

	if err := ctx.BodyParser(event); err != nil {
		return ctx.Status(fiber.StatusUnprocessableEntity).JSON(&fiber.Map{
			"status":  "failed",
			"message": err.Error(),
			"data":    nil,
		})
	}

	event, err := h.repository.RepoCreateEvent(context, event)
	if err != nil {
		return ctx.Status(fiber.StatusBadRequest).JSON(&fiber.Map{
			"status":  "failed",
			"message": err.Error(),
			"data":    nil,
		})
	}

	return ctx.Status(fiber.StatusOK).JSON(&fiber.Map{
		"status":  "success",
		"message": "successfully ticket created",
		"data":    event,
	})
}

func (h *EventHandler) UpdateMyEvent(ctx *fiber.Ctx) error {
	eventId, _ := strconv.Atoi(ctx.Params("eventId"))
	updateData := make(map[string]interface{})

	context, cancel := context.WithTimeout(context.Background(), time.Duration(5*time.Second))
	defer cancel()

	if err := ctx.BodyParser(&updateData); err != nil {
		return ctx.Status(fiber.StatusBadRequest).JSON(&fiber.Map{
			"status":  "failed",
			"message": err.Error(),
			"data":    nil,
		})
	}
	event, err := h.repository.RepoUpdateEvent(context, uint(eventId), updateData)
	if err != nil {
		return ctx.Status(fiber.StatusBadRequest).JSON(&fiber.Map{
			"status":  "failed",
			"message": err.Error(),
			"data":    nil,
		})
	}

	return ctx.Status(fiber.StatusOK).JSON(&fiber.Map{
		"status":  "success",
		"message": "successfully ticket updated",
		"data":    event,
	})

}

func (h *EventHandler) DeleteMyEvent(ctx *fiber.Ctx) error {
	eventId, _ := strconv.Atoi(ctx.Params("eventId"))
	context, cancel := context.WithTimeout(context.Background(), time.Duration(5*time.Second))
	defer cancel()

	err := h.repository.RepoDeleteEvent(context, uint(eventId))
	if err != nil {
		return ctx.Status(fiber.StatusBadRequest).JSON(&fiber.Map{
			"status":  "failed",
			"message": err.Error(),
		})
	}

	return ctx.Status(fiber.StatusOK).JSON(&fiber.Map{
		"status":  "success",
		"message": "successfully ticket deleted",
	})

}

func NewEventHandler(router fiber.Router, repo models.EventRepo) {
	handlers := &EventHandler{
		repository: repo,
	}

	router.Get("/", handlers.GetListEvent)
	router.Post("/", handlers.CreateEvent)
	router.Get("/:eventId", handlers.GetMyEvent)
	router.Patch("/:eventId", handlers.UpdateMyEvent)
	router.Delete("/:eventId", handlers.DeleteMyEvent)
}
