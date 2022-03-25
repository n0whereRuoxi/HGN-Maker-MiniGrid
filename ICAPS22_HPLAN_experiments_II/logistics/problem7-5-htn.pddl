( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-193 - location
    l000-154 - location
    l000-825 - location
    l000-418 - location
    l000-672 - location
    l000-518 - location
    l000-783 - location
    l000-848 - location
    l000-507 - location
    p157 - obj
    p981 - obj
    p93 - obj
    p959 - obj
    p711 - obj
    p121 - obj
    p751 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-193 c000 )
    ( in-city l000-154 c000 )
    ( in-city l000-825 c000 )
    ( in-city l000-418 c000 )
    ( in-city l000-672 c000 )
    ( in-city l000-518 c000 )
    ( in-city l000-783 c000 )
    ( in-city l000-848 c000 )
    ( in-city l000-507 c000 )
    ( obj-at p157 l000-848 )
    ( obj-at p981 l000-672 )
    ( obj-at p93 l000-154 )
    ( obj-at p959 l000-507 )
    ( obj-at p711 l000-507 )
    ( obj-at p121 l000-848 )
    ( obj-at p751 l000-518 )
  )
  ( :tasks
    ( Deliver-7Pkg p157 p981 p93 p959 p711 p121 p751 l000-000 )
  )
)
