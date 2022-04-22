( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-428 - location
    l000-751 - location
    l000-60 - location
    l000-706 - location
    l000-968 - location
    l000-458 - location
    l000-304 - location
    l000-222 - location
    l000-920 - location
    l000-992 - location
    l000-287 - location
    l000-370 - location
    l000-943 - location
    l000-885 - location
    l000-333 - location
    l000-217 - location
    l000-741 - location
    l000-324 - location
    l000-57 - location
    l000-723 - location
    l000-273 - location
    l000-465 - location
    l000-858 - location
    l000-770 - location
    p663 - obj
    p188 - obj
    p92 - obj
    p817 - obj
    p867 - obj
    p183 - obj
    p79 - obj
    p149 - obj
    p118 - obj
    p779 - obj
    p200 - obj
    p255 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-428 c000 )
    ( in-city l000-751 c000 )
    ( in-city l000-60 c000 )
    ( in-city l000-706 c000 )
    ( in-city l000-968 c000 )
    ( in-city l000-458 c000 )
    ( in-city l000-304 c000 )
    ( in-city l000-222 c000 )
    ( in-city l000-920 c000 )
    ( in-city l000-992 c000 )
    ( in-city l000-287 c000 )
    ( in-city l000-370 c000 )
    ( in-city l000-943 c000 )
    ( in-city l000-885 c000 )
    ( in-city l000-333 c000 )
    ( in-city l000-217 c000 )
    ( in-city l000-741 c000 )
    ( in-city l000-324 c000 )
    ( in-city l000-57 c000 )
    ( in-city l000-723 c000 )
    ( in-city l000-273 c000 )
    ( in-city l000-465 c000 )
    ( in-city l000-858 c000 )
    ( in-city l000-770 c000 )
    ( obj-at p663 l000-885 )
    ( obj-at p188 l000-458 )
    ( obj-at p92 l000-920 )
    ( obj-at p817 l000-370 )
    ( obj-at p867 l000-60 )
    ( obj-at p183 l000-465 )
    ( obj-at p79 l000-324 )
    ( obj-at p149 l000-943 )
    ( obj-at p118 l000-706 )
    ( obj-at p779 l000-217 )
    ( obj-at p200 l000-858 )
    ( obj-at p255 l000-333 )
  )
  ( :goal
    ( and
      ( obj-at p663 l000-000 )
      ( obj-at p188 l000-000 )
      ( obj-at p92 l000-000 )
      ( obj-at p817 l000-000 )
      ( obj-at p867 l000-000 )
      ( obj-at p183 l000-000 )
      ( obj-at p79 l000-000 )
      ( obj-at p149 l000-000 )
      ( obj-at p118 l000-000 )
      ( obj-at p779 l000-000 )
      ( obj-at p200 l000-000 )
      ( obj-at p255 l000-000 )
    )
  )
)
