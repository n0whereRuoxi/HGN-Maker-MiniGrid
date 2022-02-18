( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-68 - location
    l000-399 - location
    l000-704 - location
    l000-652 - location
    l000-395 - location
    l000-847 - location
    l000-20 - location
    l000-728 - location
    p778 - obj
    p755 - obj
    p494 - obj
    p216 - obj
    p746 - obj
    p834 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-68 c000 )
    ( in-city l000-399 c000 )
    ( in-city l000-704 c000 )
    ( in-city l000-652 c000 )
    ( in-city l000-395 c000 )
    ( in-city l000-847 c000 )
    ( in-city l000-20 c000 )
    ( in-city l000-728 c000 )
    ( obj-at p778 l000-652 )
    ( obj-at p755 l000-68 )
    ( obj-at p494 l000-68 )
    ( obj-at p216 l000-728 )
    ( obj-at p746 l000-847 )
    ( obj-at p834 l000-20 )
  )
  ( :goal
    ( and
      ( obj-at p778 l000-000 )
      ( obj-at p755 l000-000 )
      ( obj-at p494 l000-000 )
      ( obj-at p216 l000-000 )
      ( obj-at p746 l000-000 )
      ( obj-at p834 l000-000 )
    )
  )
)
