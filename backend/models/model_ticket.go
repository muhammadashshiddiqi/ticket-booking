package models

import (
	"context"
	"time"
)

type Ticket struct {
	ID        uint      `json:"id" gorm:"primarykey"`
	EventID   uint      `json:"event_id"`
	UserID    uint      `json:"user_id" gorm:"foreignkey:UserID; constraint:OnUpdate:CASCADE, OnDelete:CASCADE"`
	Event     Event      `json:"event" gorm:"foreignkey:EventID; constraint:OnUpdate:CASCADE, OnDelete:CASCADE"`
	Entered   bool      `json:"entered" default:"false"`
	CreatedAt time.Time `json:"created_at"`
	UpdatedAt time.Time `json:"updated_at"`
}

type TicketRepo interface {
	GetAllTicket(ctx context.Context, userId uint) ([]*Ticket, error)
	GetMyTicket(ctx context.Context, userId uint, ticketId uint) (*Ticket, error)
	CreateTicket(ctx context.Context, userId uint, ticket *Ticket) (*Ticket, error)
	UpdateMyTicket(ctx context.Context, userId uint, ticketId uint, updateData map[string]interface{}) (*Ticket, error)
}

type ValidateEntryTicket struct {
	TicketID uint `json:"ticket_id"`
	OwnerID  uint `json:"owner_id"`
}
