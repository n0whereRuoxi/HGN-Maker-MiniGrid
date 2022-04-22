( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-780 - location
    l000-259 - location
    l000-952 - location
    l000-183 - location
    l000-996 - location
    l000-904 - location
    l000-774 - location
    l000-942 - location
    l000-846 - location
    l000-511 - location
    l000-400 - location
    l000-24 - location
    l000-36 - location
    l000-999 - location
    l000-347 - location
    l000-396 - location
    l000-137 - location
    l000-480 - location
    p238 - obj
    p775 - obj
    p820 - obj
    p720 - obj
    p987 - obj
    p163 - obj
    p537 - obj
    p302 - obj
    p914 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-780 c000 )
    ( in-city l000-259 c000 )
    ( in-city l000-952 c000 )
    ( in-city l000-183 c000 )
    ( in-city l000-996 c000 )
    ( in-city l000-904 c000 )
    ( in-city l000-774 c000 )
    ( in-city l000-942 c000 )
    ( in-city l000-846 c000 )
    ( in-city l000-511 c000 )
    ( in-city l000-400 c000 )
    ( in-city l000-24 c000 )
    ( in-city l000-36 c000 )
    ( in-city l000-999 c000 )
    ( in-city l000-347 c000 )
    ( in-city l000-396 c000 )
    ( in-city l000-137 c000 )
    ( in-city l000-480 c000 )
    ( obj-at p238 l000-904 )
    ( obj-at p775 l000-904 )
    ( obj-at p820 l000-942 )
    ( obj-at p720 l000-952 )
    ( obj-at p987 l000-846 )
    ( obj-at p163 l000-480 )
    ( obj-at p537 l000-259 )
    ( obj-at p302 l000-24 )
    ( obj-at p914 l000-952 )
  )
  ( :goal
    ( and
      ( obj-at p238 l000-000 )
      ( obj-at p775 l000-000 )
      ( obj-at p820 l000-000 )
      ( obj-at p720 l000-000 )
      ( obj-at p987 l000-000 )
      ( obj-at p163 l000-000 )
      ( obj-at p537 l000-000 )
      ( obj-at p302 l000-000 )
      ( obj-at p914 l000-000 )
    )
  )
)
