( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-918 - location
    l000-166 - location
    l000-875 - location
    l000-722 - location
    l000-153 - location
    l000-948 - location
    l000-881 - location
    l000-744 - location
    l000-169 - location
    l000-947 - location
    l000-763 - location
    l000-412 - location
    l000-541 - location
    l000-605 - location
    l000-43 - location
    l000-381 - location
    l000-830 - location
    l000-808 - location
    l000-588 - location
    l000-383 - location
    l000-644 - location
    l000-346 - location
    p529 - obj
    p132 - obj
    p996 - obj
    p759 - obj
    p754 - obj
    p990 - obj
    p541 - obj
    p16 - obj
    p485 - obj
    p36 - obj
    p29 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-918 c000 )
    ( in-city l000-166 c000 )
    ( in-city l000-875 c000 )
    ( in-city l000-722 c000 )
    ( in-city l000-153 c000 )
    ( in-city l000-948 c000 )
    ( in-city l000-881 c000 )
    ( in-city l000-744 c000 )
    ( in-city l000-169 c000 )
    ( in-city l000-947 c000 )
    ( in-city l000-763 c000 )
    ( in-city l000-412 c000 )
    ( in-city l000-541 c000 )
    ( in-city l000-605 c000 )
    ( in-city l000-43 c000 )
    ( in-city l000-381 c000 )
    ( in-city l000-830 c000 )
    ( in-city l000-808 c000 )
    ( in-city l000-588 c000 )
    ( in-city l000-383 c000 )
    ( in-city l000-644 c000 )
    ( in-city l000-346 c000 )
    ( obj-at p529 l000-875 )
    ( obj-at p132 l000-875 )
    ( obj-at p996 l000-830 )
    ( obj-at p759 l000-830 )
    ( obj-at p754 l000-381 )
    ( obj-at p990 l000-763 )
    ( obj-at p541 l000-346 )
    ( obj-at p16 l000-875 )
    ( obj-at p485 l000-918 )
    ( obj-at p36 l000-830 )
    ( obj-at p29 l000-947 )
  )
  ( :goal
    ( and
      ( obj-at p529 l000-000 )
      ( obj-at p132 l000-000 )
      ( obj-at p996 l000-000 )
      ( obj-at p759 l000-000 )
      ( obj-at p754 l000-000 )
      ( obj-at p990 l000-000 )
      ( obj-at p541 l000-000 )
      ( obj-at p16 l000-000 )
      ( obj-at p485 l000-000 )
      ( obj-at p36 l000-000 )
      ( obj-at p29 l000-000 )
    )
  )
)
