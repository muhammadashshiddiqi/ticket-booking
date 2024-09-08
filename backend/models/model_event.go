package models

import (
	"context"
	"time"

	"gorm.io/gorm"
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


func (e *Event) AfterFind(db *gorm.DB) (err error)  {
	baseQuery := db.Model(&Ticket{}).Where(&Ticket{EventID: e.ID})

	if res := baseQuery.Count(&e.TotalTicketsPurchased); res.Error != nil {
		return res.Error
	}

	if res := baseQuery.Where("entered = ?", true).Count(&e.TotalTicketsEntered); res.Error != nil {
		return res.Error
	}

	return nil
}