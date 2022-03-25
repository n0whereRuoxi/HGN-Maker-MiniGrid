( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-111 - location
    l000-474 - location
    l000-759 - location
    p62 - obj
    p250 - obj
    p708 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-111 c000 )
    ( in-city l000-474 c000 )
    ( in-city l000-759 c000 )
    ( obj-at p62 l000-111 )
    ( obj-at p250 l000-759 )
    ( obj-at p708 l000-759 )
  )
  ( :goal
    ( and
      ( obj-at p62 l000-000 )
      ( obj-at p250 l000-000 )
      ( obj-at p708 l000-000 )
    )
  )
)
