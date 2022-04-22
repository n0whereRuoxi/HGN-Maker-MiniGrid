( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-452 - location
    l000-547 - location
    l000-427 - location
    l000-625 - location
    l000-855 - location
    l000-71 - location
    l000-676 - location
    l000-437 - location
    l000-632 - location
    l000-210 - location
    l000-600 - location
    l000-621 - location
    l000-793 - location
    l000-588 - location
    l000-274 - location
    l000-32 - location
    l000-960 - location
    l000-286 - location
    l000-362 - location
    p430 - obj
    p369 - obj
    p406 - obj
    p986 - obj
    p80 - obj
    p123 - obj
    p713 - obj
    p289 - obj
    p25 - obj
    p717 - obj
    p183 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-452 c000 )
    ( in-city l000-547 c000 )
    ( in-city l000-427 c000 )
    ( in-city l000-625 c000 )
    ( in-city l000-855 c000 )
    ( in-city l000-71 c000 )
    ( in-city l000-676 c000 )
    ( in-city l000-437 c000 )
    ( in-city l000-632 c000 )
    ( in-city l000-210 c000 )
    ( in-city l000-600 c000 )
    ( in-city l000-621 c000 )
    ( in-city l000-793 c000 )
    ( in-city l000-588 c000 )
    ( in-city l000-274 c000 )
    ( in-city l000-32 c000 )
    ( in-city l000-960 c000 )
    ( in-city l000-286 c000 )
    ( in-city l000-362 c000 )
    ( obj-at p430 l000-274 )
    ( obj-at p369 l000-793 )
    ( obj-at p406 l000-71 )
    ( obj-at p986 l000-547 )
    ( obj-at p80 l000-362 )
    ( obj-at p123 l000-588 )
    ( obj-at p713 l000-286 )
    ( obj-at p289 l000-427 )
    ( obj-at p25 l000-362 )
    ( obj-at p717 l000-632 )
    ( obj-at p183 l000-676 )
  )
  ( :goal
    ( and
      ( obj-at p430 l000-000 )
      ( obj-at p369 l000-000 )
      ( obj-at p406 l000-000 )
      ( obj-at p986 l000-000 )
      ( obj-at p80 l000-000 )
      ( obj-at p123 l000-000 )
      ( obj-at p713 l000-000 )
      ( obj-at p289 l000-000 )
      ( obj-at p25 l000-000 )
      ( obj-at p717 l000-000 )
      ( obj-at p183 l000-000 )
    )
  )
)
