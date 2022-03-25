( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-876 - location
    l000-37 - location
    l000-443 - location
    l000-98 - location
    l000-923 - location
    l000-235 - location
    l000-428 - location
    l000-194 - location
    l000-595 - location
    l000-111 - location
    p255 - obj
    p143 - obj
    p233 - obj
    p860 - obj
    p848 - obj
    p702 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-876 c000 )
    ( in-city l000-37 c000 )
    ( in-city l000-443 c000 )
    ( in-city l000-98 c000 )
    ( in-city l000-923 c000 )
    ( in-city l000-235 c000 )
    ( in-city l000-428 c000 )
    ( in-city l000-194 c000 )
    ( in-city l000-595 c000 )
    ( in-city l000-111 c000 )
    ( obj-at p255 l000-235 )
    ( obj-at p143 l000-595 )
    ( obj-at p233 l000-443 )
    ( obj-at p860 l000-194 )
    ( obj-at p848 l000-98 )
    ( obj-at p702 l000-876 )
  )
  ( :tasks
    ( Deliver-6Pkg p255 p143 p233 p860 p848 p702 l000-000 )
  )
)
