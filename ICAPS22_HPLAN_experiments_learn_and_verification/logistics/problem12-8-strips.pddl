( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-845 - location
    l000-137 - location
    l000-10 - location
    l000-281 - location
    l000-182 - location
    l000-502 - location
    l000-570 - location
    l000-368 - location
    l000-14 - location
    l000-789 - location
    l000-361 - location
    l000-342 - location
    l000-576 - location
    l000-901 - location
    l000-636 - location
    l000-165 - location
    l000-783 - location
    l000-868 - location
    l000-226 - location
    l000-339 - location
    p222 - obj
    p343 - obj
    p878 - obj
    p598 - obj
    p244 - obj
    p990 - obj
    p832 - obj
    p802 - obj
    p346 - obj
    p360 - obj
    p198 - obj
    p550 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-845 c000 )
    ( in-city l000-137 c000 )
    ( in-city l000-10 c000 )
    ( in-city l000-281 c000 )
    ( in-city l000-182 c000 )
    ( in-city l000-502 c000 )
    ( in-city l000-570 c000 )
    ( in-city l000-368 c000 )
    ( in-city l000-14 c000 )
    ( in-city l000-789 c000 )
    ( in-city l000-361 c000 )
    ( in-city l000-342 c000 )
    ( in-city l000-576 c000 )
    ( in-city l000-901 c000 )
    ( in-city l000-636 c000 )
    ( in-city l000-165 c000 )
    ( in-city l000-783 c000 )
    ( in-city l000-868 c000 )
    ( in-city l000-226 c000 )
    ( in-city l000-339 c000 )
    ( obj-at p222 l000-14 )
    ( obj-at p343 l000-636 )
    ( obj-at p878 l000-502 )
    ( obj-at p598 l000-502 )
    ( obj-at p244 l000-570 )
    ( obj-at p990 l000-368 )
    ( obj-at p832 l000-368 )
    ( obj-at p802 l000-901 )
    ( obj-at p346 l000-361 )
    ( obj-at p360 l000-14 )
    ( obj-at p198 l000-14 )
    ( obj-at p550 l000-226 )
  )
  ( :goal
    ( and
      ( obj-at p222 l000-000 )
      ( obj-at p343 l000-000 )
      ( obj-at p878 l000-000 )
      ( obj-at p598 l000-000 )
      ( obj-at p244 l000-000 )
      ( obj-at p990 l000-000 )
      ( obj-at p832 l000-000 )
      ( obj-at p802 l000-000 )
      ( obj-at p346 l000-000 )
      ( obj-at p360 l000-000 )
      ( obj-at p198 l000-000 )
      ( obj-at p550 l000-000 )
    )
  )
)
