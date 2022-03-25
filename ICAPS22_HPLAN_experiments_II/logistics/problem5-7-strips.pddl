( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-134 - location
    l000-904 - location
    l000-574 - location
    l000-229 - location
    l000-182 - location
    l000-880 - location
    l000-509 - location
    l000-669 - location
    l000-935 - location
    p89 - obj
    p178 - obj
    p1 - obj
    p854 - obj
    p481 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-134 c000 )
    ( in-city l000-904 c000 )
    ( in-city l000-574 c000 )
    ( in-city l000-229 c000 )
    ( in-city l000-182 c000 )
    ( in-city l000-880 c000 )
    ( in-city l000-509 c000 )
    ( in-city l000-669 c000 )
    ( in-city l000-935 c000 )
    ( obj-at p89 l000-880 )
    ( obj-at p178 l000-182 )
    ( obj-at p1 l000-182 )
    ( obj-at p854 l000-904 )
    ( obj-at p481 l000-182 )
  )
  ( :goal
    ( and
      ( obj-at p89 l000-000 )
      ( obj-at p178 l000-000 )
      ( obj-at p1 l000-000 )
      ( obj-at p854 l000-000 )
      ( obj-at p481 l000-000 )
    )
  )
)
