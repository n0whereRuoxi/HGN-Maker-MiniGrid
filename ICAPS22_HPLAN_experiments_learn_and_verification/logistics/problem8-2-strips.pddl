( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-444 - location
    l000-486 - location
    l000-786 - location
    l000-557 - location
    l000-693 - location
    l000-853 - location
    l000-704 - location
    l000-524 - location
    p808 - obj
    p869 - obj
    p611 - obj
    p478 - obj
    p715 - obj
    p238 - obj
    p583 - obj
    p267 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-444 c000 )
    ( in-city l000-486 c000 )
    ( in-city l000-786 c000 )
    ( in-city l000-557 c000 )
    ( in-city l000-693 c000 )
    ( in-city l000-853 c000 )
    ( in-city l000-704 c000 )
    ( in-city l000-524 c000 )
    ( obj-at p808 l000-557 )
    ( obj-at p869 l000-853 )
    ( obj-at p611 l000-853 )
    ( obj-at p478 l000-853 )
    ( obj-at p715 l000-557 )
    ( obj-at p238 l000-524 )
    ( obj-at p583 l000-444 )
    ( obj-at p267 l000-853 )
  )
  ( :goal
    ( and
      ( obj-at p808 l000-000 )
      ( obj-at p869 l000-000 )
      ( obj-at p611 l000-000 )
      ( obj-at p478 l000-000 )
      ( obj-at p715 l000-000 )
      ( obj-at p238 l000-000 )
      ( obj-at p583 l000-000 )
      ( obj-at p267 l000-000 )
    )
  )
)
