( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-46 - location
    l000-249 - location
    l000-17 - location
    l000-74 - location
    l000-451 - location
    l000-677 - location
    l000-673 - location
    p53 - obj
    p968 - obj
    p838 - obj
    p669 - obj
    p507 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-46 c000 )
    ( in-city l000-249 c000 )
    ( in-city l000-17 c000 )
    ( in-city l000-74 c000 )
    ( in-city l000-451 c000 )
    ( in-city l000-677 c000 )
    ( in-city l000-673 c000 )
    ( obj-at p53 l000-677 )
    ( obj-at p968 l000-74 )
    ( obj-at p838 l000-673 )
    ( obj-at p669 l000-74 )
    ( obj-at p507 l000-74 )
  )
  ( :goal
    ( and
      ( obj-at p53 l000-000 )
      ( obj-at p968 l000-000 )
      ( obj-at p838 l000-000 )
      ( obj-at p669 l000-000 )
      ( obj-at p507 l000-000 )
    )
  )
)
