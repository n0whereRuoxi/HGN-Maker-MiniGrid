( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-383 - location
    l000-216 - location
    l000-599 - location
    l000-647 - location
    l000-881 - location
    l000-568 - location
    l000-737 - location
    p815 - obj
    p570 - obj
    p42 - obj
    p283 - obj
    p322 - obj
    p946 - obj
    p134 - obj
    p96 - obj
    p705 - obj
    p389 - obj
    p173 - obj
    p125 - obj
    p531 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-383 c000 )
    ( in-city l000-216 c000 )
    ( in-city l000-599 c000 )
    ( in-city l000-647 c000 )
    ( in-city l000-881 c000 )
    ( in-city l000-568 c000 )
    ( in-city l000-737 c000 )
    ( obj-at p815 l000-568 )
    ( obj-at p570 l000-737 )
    ( obj-at p42 l000-647 )
    ( obj-at p283 l000-599 )
    ( obj-at p322 l000-881 )
    ( obj-at p946 l000-737 )
    ( obj-at p134 l000-599 )
    ( obj-at p96 l000-647 )
    ( obj-at p705 l000-647 )
    ( obj-at p389 l000-216 )
    ( obj-at p173 l000-647 )
    ( obj-at p125 l000-216 )
    ( obj-at p531 l000-737 )
  )
  ( :goal
    ( and
      ( obj-at p815 l000-000 )
      ( obj-at p570 l000-000 )
      ( obj-at p42 l000-000 )
      ( obj-at p283 l000-000 )
      ( obj-at p322 l000-000 )
      ( obj-at p946 l000-000 )
      ( obj-at p134 l000-000 )
      ( obj-at p96 l000-000 )
      ( obj-at p705 l000-000 )
      ( obj-at p389 l000-000 )
      ( obj-at p173 l000-000 )
      ( obj-at p125 l000-000 )
      ( obj-at p531 l000-000 )
    )
  )
)
