( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-354 - location
    l000-291 - location
    l000-210 - location
    l000-335 - location
    l000-435 - location
    l000-724 - location
    l000-449 - location
    l000-671 - location
    l000-28 - location
    l000-369 - location
    l000-4 - location
    l000-824 - location
    l000-694 - location
    l000-611 - location
    p762 - obj
    p659 - obj
    p253 - obj
    p596 - obj
    p207 - obj
    p686 - obj
    p927 - obj
    p473 - obj
    p727 - obj
    p342 - obj
    p838 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-354 c000 )
    ( in-city l000-291 c000 )
    ( in-city l000-210 c000 )
    ( in-city l000-335 c000 )
    ( in-city l000-435 c000 )
    ( in-city l000-724 c000 )
    ( in-city l000-449 c000 )
    ( in-city l000-671 c000 )
    ( in-city l000-28 c000 )
    ( in-city l000-369 c000 )
    ( in-city l000-4 c000 )
    ( in-city l000-824 c000 )
    ( in-city l000-694 c000 )
    ( in-city l000-611 c000 )
    ( obj-at p762 l000-28 )
    ( obj-at p659 l000-449 )
    ( obj-at p253 l000-694 )
    ( obj-at p596 l000-335 )
    ( obj-at p207 l000-724 )
    ( obj-at p686 l000-435 )
    ( obj-at p927 l000-694 )
    ( obj-at p473 l000-369 )
    ( obj-at p727 l000-435 )
    ( obj-at p342 l000-449 )
    ( obj-at p838 l000-694 )
  )
  ( :goal
    ( and
      ( obj-at p762 l000-000 )
      ( obj-at p659 l000-000 )
      ( obj-at p253 l000-000 )
      ( obj-at p596 l000-000 )
      ( obj-at p207 l000-000 )
      ( obj-at p686 l000-000 )
      ( obj-at p927 l000-000 )
      ( obj-at p473 l000-000 )
      ( obj-at p727 l000-000 )
      ( obj-at p342 l000-000 )
      ( obj-at p838 l000-000 )
    )
  )
)
