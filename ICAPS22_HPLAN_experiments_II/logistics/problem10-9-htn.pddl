( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-192 - location
    l000-998 - location
    l000-775 - location
    l000-151 - location
    l000-69 - location
    l000-602 - location
    l000-507 - location
    l000-290 - location
    l000-679 - location
    l000-259 - location
    p120 - obj
    p305 - obj
    p872 - obj
    p153 - obj
    p423 - obj
    p502 - obj
    p702 - obj
    p858 - obj
    p181 - obj
    p222 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-192 c000 )
    ( in-city l000-998 c000 )
    ( in-city l000-775 c000 )
    ( in-city l000-151 c000 )
    ( in-city l000-69 c000 )
    ( in-city l000-602 c000 )
    ( in-city l000-507 c000 )
    ( in-city l000-290 c000 )
    ( in-city l000-679 c000 )
    ( in-city l000-259 c000 )
    ( obj-at p120 l000-998 )
    ( obj-at p305 l000-151 )
    ( obj-at p872 l000-259 )
    ( obj-at p153 l000-775 )
    ( obj-at p423 l000-507 )
    ( obj-at p502 l000-998 )
    ( obj-at p702 l000-679 )
    ( obj-at p858 l000-192 )
    ( obj-at p181 l000-259 )
    ( obj-at p222 l000-507 )
  )
  ( :tasks
    ( Deliver-10Pkg p120 p305 p872 p153 p423 p502 p702 p858 p181 p222 l000-000 )
  )
)
