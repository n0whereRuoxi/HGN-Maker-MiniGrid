( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-653 - location
    l000-975 - location
    l000-854 - location
    p665 - obj
    p597 - obj
    p152 - obj
    p963 - obj
    p178 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-653 c000 )
    ( in-city l000-975 c000 )
    ( in-city l000-854 c000 )
    ( obj-at p665 l000-975 )
    ( obj-at p597 l000-854 )
    ( obj-at p152 l000-653 )
    ( obj-at p963 l000-854 )
    ( obj-at p178 l000-653 )
  )
  ( :goal
    ( and
      ( obj-at p665 l000-000 )
      ( obj-at p597 l000-000 )
      ( obj-at p152 l000-000 )
      ( obj-at p963 l000-000 )
      ( obj-at p178 l000-000 )
    )
  )
)
