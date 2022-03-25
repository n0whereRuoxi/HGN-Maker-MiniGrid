( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-842 - location
    l000-264 - location
    l000-824 - location
    l000-332 - location
    l000-21 - location
    l000-62 - location
    l000-833 - location
    l000-431 - location
    l000-475 - location
    l000-226 - location
    l000-87 - location
    l000-523 - location
    l000-878 - location
    l000-850 - location
    l000-928 - location
    l000-989 - location
    p632 - obj
    p546 - obj
    p923 - obj
    p671 - obj
    p688 - obj
    p948 - obj
    p420 - obj
    p761 - obj
    p756 - obj
    p857 - obj
    p912 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-842 c000 )
    ( in-city l000-264 c000 )
    ( in-city l000-824 c000 )
    ( in-city l000-332 c000 )
    ( in-city l000-21 c000 )
    ( in-city l000-62 c000 )
    ( in-city l000-833 c000 )
    ( in-city l000-431 c000 )
    ( in-city l000-475 c000 )
    ( in-city l000-226 c000 )
    ( in-city l000-87 c000 )
    ( in-city l000-523 c000 )
    ( in-city l000-878 c000 )
    ( in-city l000-850 c000 )
    ( in-city l000-928 c000 )
    ( in-city l000-989 c000 )
    ( obj-at p632 l000-226 )
    ( obj-at p546 l000-475 )
    ( obj-at p923 l000-226 )
    ( obj-at p671 l000-62 )
    ( obj-at p688 l000-850 )
    ( obj-at p948 l000-226 )
    ( obj-at p420 l000-87 )
    ( obj-at p761 l000-523 )
    ( obj-at p756 l000-842 )
    ( obj-at p857 l000-850 )
    ( obj-at p912 l000-989 )
  )
  ( :goal
    ( and
      ( obj-at p632 l000-000 )
      ( obj-at p546 l000-000 )
      ( obj-at p923 l000-000 )
      ( obj-at p671 l000-000 )
      ( obj-at p688 l000-000 )
      ( obj-at p948 l000-000 )
      ( obj-at p420 l000-000 )
      ( obj-at p761 l000-000 )
      ( obj-at p756 l000-000 )
      ( obj-at p857 l000-000 )
      ( obj-at p912 l000-000 )
    )
  )
)
