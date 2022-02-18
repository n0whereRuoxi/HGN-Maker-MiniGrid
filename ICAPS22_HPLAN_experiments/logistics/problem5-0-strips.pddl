( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-401 - location
    l000-854 - location
    l000-611 - location
    l000-358 - location
    p286 - obj
    p306 - obj
    p422 - obj
    p817 - obj
    p586 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-401 c000 )
    ( in-city l000-854 c000 )
    ( in-city l000-611 c000 )
    ( in-city l000-358 c000 )
    ( obj-at p286 l000-611 )
    ( obj-at p306 l000-358 )
    ( obj-at p422 l000-401 )
    ( obj-at p817 l000-401 )
    ( obj-at p586 l000-854 )
  )
  ( :goal
    ( and
      ( obj-at p286 l000-000 )
      ( obj-at p306 l000-000 )
      ( obj-at p422 l000-000 )
      ( obj-at p817 l000-000 )
      ( obj-at p586 l000-000 )
    )
  )
)
