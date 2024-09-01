package models

import (
	"context"
	"time"
)

type Event struct {
	ID                    uint      `json:"id" gorm:"primarykey"`
	NIN                   string    `json:"nin"`
	Name                  string    `json:"name"`
	Location              string    `json:"location"`
	TotalTicketsPurchased int64     `json:"total_tickets_purchased" gorm:"-"`
	TotalTicketsEntered   int64     `json:"total_tickets_entered" gorm:"-"`
	Date                  time.Time `json:"date"`
	CreatedAt             time.Time `json:"created_at"`
	UpdatedAt             time.Time `json:"updated_at"`
}

type EventRepo interface {
	RepoGetAllEvent(ctx context.Context) ([]*Event, error)
	RepoGetEvent(ctx context.Context, eventId uint) (*Event, error)
	RepoCreateEvent(ctx context.Context, event *Event) (*Event, error)
	RepoUpdateEvent(ctx context.Context, eventId uint, updateData map[string]interface{}) (*Event, error)
	RepoDeleteEvent(ctx context.Context, eventId uint) error
}
