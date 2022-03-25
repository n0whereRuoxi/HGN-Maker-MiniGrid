( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-627 - location
    l000-576 - location
    l000-226 - location
    l000-862 - location
    l000-801 - location
    p2 - obj
    p591 - obj
    p759 - obj
    p136 - obj
    p584 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-627 c000 )
    ( in-city l000-576 c000 )
    ( in-city l000-226 c000 )
    ( in-city l000-862 c000 )
    ( in-city l000-801 c000 )
    ( obj-at p2 l000-576 )
    ( obj-at p591 l000-576 )
    ( obj-at p759 l000-576 )
    ( obj-at p136 l000-627 )
    ( obj-at p584 l000-226 )
  )
  ( :goal
    ( and
      ( obj-at p2 l000-000 )
      ( obj-at p591 l000-000 )
      ( obj-at p759 l000-000 )
      ( obj-at p136 l000-000 )
      ( obj-at p584 l000-000 )
    )
  )
)
