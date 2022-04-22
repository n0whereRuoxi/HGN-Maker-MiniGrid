( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-380 - location
    l000-208 - location
    l000-669 - location
    l000-537 - location
    l000-767 - location
    l000-142 - location
    l000-748 - location
    l000-266 - location
    l000-21 - location
    l000-222 - location
    l000-682 - location
    p221 - obj
    p660 - obj
    p288 - obj
    p678 - obj
    p866 - obj
    p328 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-380 c000 )
    ( in-city l000-208 c000 )
    ( in-city l000-669 c000 )
    ( in-city l000-537 c000 )
    ( in-city l000-767 c000 )
    ( in-city l000-142 c000 )
    ( in-city l000-748 c000 )
    ( in-city l000-266 c000 )
    ( in-city l000-21 c000 )
    ( in-city l000-222 c000 )
    ( in-city l000-682 c000 )
    ( obj-at p221 l000-222 )
    ( obj-at p660 l000-21 )
    ( obj-at p288 l000-748 )
    ( obj-at p678 l000-669 )
    ( obj-at p866 l000-682 )
    ( obj-at p328 l000-222 )
  )
  ( :goal
    ( and
      ( obj-at p221 l000-000 )
      ( obj-at p660 l000-000 )
      ( obj-at p288 l000-000 )
      ( obj-at p678 l000-000 )
      ( obj-at p866 l000-000 )
      ( obj-at p328 l000-000 )
    )
  )
)
