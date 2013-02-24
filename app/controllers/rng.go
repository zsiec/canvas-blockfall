package controllers

import "github.com/robfig/revel"
import "math/rand"
import "time"

type Rng struct {
	*revel.Controller
}

type Response struct {
  Seed int
}

func (c Rng) Show() revel.Result {
  rand.Seed(time.Now().UnixNano())
  seedResponse := map[string] int { "seed": rand.Int() }
  return c.RenderJson(seedResponse)
}

