( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-750 - location
    l000-526 - location
    l000-692 - location
    l000-661 - location
    l000-694 - location
    l000-140 - location
    l000-287 - location
    l000-892 - location
    l000-433 - location
    l000-633 - location
    l000-638 - location
    l000-995 - location
    p596 - obj
    p89 - obj
    p59 - obj
    p627 - obj
    p200 - obj
    p326 - obj
    p125 - obj
    p255 - obj
    p17 - obj
    p266 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-750 c000 )
    ( in-city l000-526 c000 )
    ( in-city l000-692 c000 )
    ( in-city l000-661 c000 )
    ( in-city l000-694 c000 )
    ( in-city l000-140 c000 )
    ( in-city l000-287 c000 )
    ( in-city l000-892 c000 )
    ( in-city l000-433 c000 )
    ( in-city l000-633 c000 )
    ( in-city l000-638 c000 )
    ( in-city l000-995 c000 )
    ( obj-at p596 l000-750 )
    ( obj-at p89 l000-287 )
    ( obj-at p59 l000-692 )
    ( obj-at p627 l000-633 )
    ( obj-at p200 l000-526 )
    ( obj-at p326 l000-140 )
    ( obj-at p125 l000-140 )
    ( obj-at p255 l000-526 )
    ( obj-at p17 l000-526 )
    ( obj-at p266 l000-750 )
  )
  ( :goal
    ( and
      ( obj-at p596 l000-000 )
      ( obj-at p89 l000-000 )
      ( obj-at p59 l000-000 )
      ( obj-at p627 l000-000 )
      ( obj-at p200 l000-000 )
      ( obj-at p326 l000-000 )
      ( obj-at p125 l000-000 )
      ( obj-at p255 l000-000 )
      ( obj-at p17 l000-000 )
      ( obj-at p266 l000-000 )
    )
  )
)
