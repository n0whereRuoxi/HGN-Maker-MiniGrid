( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-609 - location
    l000-981 - location
    l000-875 - location
    l000-288 - location
    l000-462 - location
    p981 - obj
    p875 - obj
    p981 - obj
    p609 - obj
    p609 - obj
    p288 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-609 c000 )
    ( in-city l000-981 c000 )
    ( in-city l000-875 c000 )
    ( in-city l000-288 c000 )
    ( in-city l000-462 c000 )
    ( obj-at p981 l000-981 )
    ( obj-at p875 l000-875 )
    ( obj-at p981 l000-981 )
    ( obj-at p609 l000-609 )
    ( obj-at p609 l000-609 )
    ( obj-at p288 l000-288 )
  )
  ( :goal
    ( and
      ( obj-at p981 l000-000 )
      ( obj-at p875 l000-000 )
      ( obj-at p981 l000-000 )
      ( obj-at p609 l000-000 )
      ( obj-at p609 l000-000 )
      ( obj-at p288 l000-000 )
    )
  )
)
