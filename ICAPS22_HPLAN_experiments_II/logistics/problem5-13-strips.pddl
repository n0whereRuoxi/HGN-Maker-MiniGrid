( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-631 - location
    l000-293 - location
    p641 - obj
    p961 - obj
    p558 - obj
    p468 - obj
    p779 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-631 c000 )
    ( in-city l000-293 c000 )
    ( obj-at p641 l000-631 )
    ( obj-at p961 l000-293 )
    ( obj-at p558 l000-631 )
    ( obj-at p468 l000-293 )
    ( obj-at p779 l000-631 )
  )
  ( :goal
    ( and
      ( obj-at p641 l000-000 )
      ( obj-at p961 l000-000 )
      ( obj-at p558 l000-000 )
      ( obj-at p468 l000-000 )
      ( obj-at p779 l000-000 )
    )
  )
)
