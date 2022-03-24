( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-684 - location
    l000-278 - location
    p703 - obj
    p772 - obj
    p520 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-684 c000 )
    ( in-city l000-278 c000 )
    ( obj-at p703 l000-278 )
    ( obj-at p772 l000-278 )
    ( obj-at p520 l000-278 )
  )
  ( :goal
    ( and
      ( obj-at p703 l000-000 )
      ( obj-at p772 l000-000 )
      ( obj-at p520 l000-000 )
    )
  )
)
