( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-856 - location
    l000-9 - location
    l000-362 - location
    l000-698 - location
    p134 - obj
    p326 - obj
    p542 - obj
    p624 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-856 c000 )
    ( in-city l000-9 c000 )
    ( in-city l000-362 c000 )
    ( in-city l000-698 c000 )
    ( obj-at p134 l000-856 )
    ( obj-at p326 l000-9 )
    ( obj-at p542 l000-362 )
    ( obj-at p624 l000-698 )
  )
  ( :goal
    ( and
      ( obj-at p134 l000-000 )
      ( obj-at p326 l000-000 )
      ( obj-at p542 l000-000 )
      ( obj-at p624 l000-000 )
    )
  )
)
