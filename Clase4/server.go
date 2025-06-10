package main

import (
	"github.com/gofiber/fiber/v2"
)

func initServer() {
	app := fiber.New()
	app.Get("/hello", func(c *fiber.Ctx) error {
		return c.Status(fiber.StatusOK).JSON("HOla desde golang y fiber!!!")
	})

	app.Listen(":6000")
}
