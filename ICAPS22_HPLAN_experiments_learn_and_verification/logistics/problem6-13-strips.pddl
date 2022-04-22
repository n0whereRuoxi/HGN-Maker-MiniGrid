( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-685 - location
    l000-568 - location
    l000-621 - location
    l000-56 - location
    l000-238 - location
    l000-959 - location
    l000-468 - location
    l000-176 - location
    l000-347 - location
    l000-989 - location
    l000-703 - location
    l000-197 - location
    p323 - obj
    p896 - obj
    p266 - obj
    p45 - obj
    p786 - obj
    p841 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-685 c000 )
    ( in-city l000-568 c000 )
    ( in-city l000-621 c000 )
    ( in-city l000-56 c000 )
    ( in-city l000-238 c000 )
    ( in-city l000-959 c000 )
    ( in-city l000-468 c000 )
    ( in-city l000-176 c000 )
    ( in-city l000-347 c000 )
    ( in-city l000-989 c000 )
    ( in-city l000-703 c000 )
    ( in-city l000-197 c000 )
    ( obj-at p323 l000-959 )
    ( obj-at p896 l000-703 )
    ( obj-at p266 l000-176 )
    ( obj-at p45 l000-176 )
    ( obj-at p786 l000-468 )
    ( obj-at p841 l000-959 )
  )
  ( :goal
    ( and
      ( obj-at p323 l000-000 )
      ( obj-at p896 l000-000 )
      ( obj-at p266 l000-000 )
      ( obj-at p45 l000-000 )
      ( obj-at p786 l000-000 )
      ( obj-at p841 l000-000 )
    )
  )
)
