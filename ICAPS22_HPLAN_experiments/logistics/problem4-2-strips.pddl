( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-658 - location
    l000-947 - location
    l000-699 - location
    l000-665 - location
    p675 - obj
    p419 - obj
    p714 - obj
    p563 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-658 c000 )
    ( in-city l000-947 c000 )
    ( in-city l000-699 c000 )
    ( in-city l000-665 c000 )
    ( obj-at p675 l000-665 )
    ( obj-at p419 l000-658 )
    ( obj-at p714 l000-947 )
    ( obj-at p563 l000-658 )
  )
  ( :goal
    ( and
      ( obj-at p675 l000-000 )
      ( obj-at p419 l000-000 )
      ( obj-at p714 l000-000 )
      ( obj-at p563 l000-000 )
    )
  )
)
