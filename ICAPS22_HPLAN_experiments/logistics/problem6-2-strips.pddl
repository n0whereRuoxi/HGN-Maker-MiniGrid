( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-716 - location
    l000-112 - location
    l000-839 - location
    l000-146 - location
    l000-468 - location
    l000-171 - location
    p716 - obj
    p716 - obj
    p146 - obj
    p468 - obj
    p839 - obj
    p171 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-716 c000 )
    ( in-city l000-112 c000 )
    ( in-city l000-839 c000 )
    ( in-city l000-146 c000 )
    ( in-city l000-468 c000 )
    ( in-city l000-171 c000 )
    ( obj-at p716 l000-716 )
    ( obj-at p716 l000-716 )
    ( obj-at p146 l000-146 )
    ( obj-at p468 l000-468 )
    ( obj-at p839 l000-839 )
    ( obj-at p171 l000-171 )
  )
  ( :goal
    ( and
      ( obj-at p716 l000-000 )
      ( obj-at p716 l000-000 )
      ( obj-at p146 l000-000 )
      ( obj-at p468 l000-000 )
      ( obj-at p839 l000-000 )
      ( obj-at p171 l000-000 )
    )
  )
)
