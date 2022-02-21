( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-618 - location
    l000-181 - location
    l000-528 - location
    l000-835 - location
    l000-491 - location
    l000-65 - location
    l000-632 - location
    l000-193 - location
    p532 - obj
    p432 - obj
    p680 - obj
    p283 - obj
    p742 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-618 c000 )
    ( in-city l000-181 c000 )
    ( in-city l000-528 c000 )
    ( in-city l000-835 c000 )
    ( in-city l000-491 c000 )
    ( in-city l000-65 c000 )
    ( in-city l000-632 c000 )
    ( in-city l000-193 c000 )
    ( obj-at p532 l000-193 )
    ( obj-at p432 l000-835 )
    ( obj-at p680 l000-491 )
    ( obj-at p283 l000-181 )
    ( obj-at p742 l000-528 )
  )
  ( :goal
    ( and
      ( obj-at p532 l000-000 )
      ( obj-at p432 l000-000 )
      ( obj-at p680 l000-000 )
      ( obj-at p283 l000-000 )
      ( obj-at p742 l000-000 )
    )
  )
)
