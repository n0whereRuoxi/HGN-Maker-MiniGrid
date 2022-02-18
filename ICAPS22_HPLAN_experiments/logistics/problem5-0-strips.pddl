( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-647 - location
    l000-121 - location
    l000-711 - location
    l000-557 - location
    l000-966 - location
    l000-82 - location
    l000-785 - location
    l000-844 - location
    l000-896 - location
    p647 - obj
    p844 - obj
    p557 - obj
    p896 - obj
    p82 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-647 c000 )
    ( in-city l000-121 c000 )
    ( in-city l000-711 c000 )
    ( in-city l000-557 c000 )
    ( in-city l000-966 c000 )
    ( in-city l000-82 c000 )
    ( in-city l000-785 c000 )
    ( in-city l000-844 c000 )
    ( in-city l000-896 c000 )
    ( obj-at p647 l000-647 )
    ( obj-at p844 l000-844 )
    ( obj-at p557 l000-557 )
    ( obj-at p896 l000-896 )
    ( obj-at p82 l000-82 )
  )
  ( :goal
    ( and
      ( obj-at p647 l000-000 )
      ( obj-at p844 l000-000 )
      ( obj-at p557 l000-000 )
      ( obj-at p896 l000-000 )
      ( obj-at p82 l000-000 )
    )
  )
)
