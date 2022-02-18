( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-338 - location
    l000-998 - location
    l000-838 - location
    l000-375 - location
    l000-728 - location
    l000-865 - location
    p25 - obj
    p165 - obj
    p954 - obj
    p515 - obj
    p790 - obj
    p83 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-338 c000 )
    ( in-city l000-998 c000 )
    ( in-city l000-838 c000 )
    ( in-city l000-375 c000 )
    ( in-city l000-728 c000 )
    ( in-city l000-865 c000 )
    ( obj-at p25 l000-865 )
    ( obj-at p165 l000-375 )
    ( obj-at p954 l000-338 )
    ( obj-at p515 l000-865 )
    ( obj-at p790 l000-728 )
    ( obj-at p83 l000-865 )
  )
  ( :goal
    ( and
      ( obj-at p25 l000-000 )
      ( obj-at p165 l000-000 )
      ( obj-at p954 l000-000 )
      ( obj-at p515 l000-000 )
      ( obj-at p790 l000-000 )
      ( obj-at p83 l000-000 )
    )
  )
)
