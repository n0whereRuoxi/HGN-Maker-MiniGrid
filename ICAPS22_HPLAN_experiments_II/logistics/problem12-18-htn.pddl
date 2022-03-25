( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-153 - location
    l000-817 - location
    l000-405 - location
    l000-771 - location
    l000-48 - location
    l000-513 - location
    l000-711 - location
    l000-63 - location
    p149 - obj
    p758 - obj
    p876 - obj
    p315 - obj
    p811 - obj
    p828 - obj
    p380 - obj
    p233 - obj
    p732 - obj
    p12 - obj
    p873 - obj
    p863 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-153 c000 )
    ( in-city l000-817 c000 )
    ( in-city l000-405 c000 )
    ( in-city l000-771 c000 )
    ( in-city l000-48 c000 )
    ( in-city l000-513 c000 )
    ( in-city l000-711 c000 )
    ( in-city l000-63 c000 )
    ( obj-at p149 l000-817 )
    ( obj-at p758 l000-63 )
    ( obj-at p876 l000-405 )
    ( obj-at p315 l000-153 )
    ( obj-at p811 l000-405 )
    ( obj-at p828 l000-711 )
    ( obj-at p380 l000-711 )
    ( obj-at p233 l000-153 )
    ( obj-at p732 l000-48 )
    ( obj-at p12 l000-405 )
    ( obj-at p873 l000-48 )
    ( obj-at p863 l000-48 )
  )
  ( :tasks
    ( Deliver-12Pkg p149 p758 p876 p315 p811 p828 p380 p233 p732 p12 p873 p863 l000-000 )
  )
)
