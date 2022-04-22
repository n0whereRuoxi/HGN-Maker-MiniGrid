( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-299 - location
    l000-397 - location
    l000-172 - location
    l000-148 - location
    l000-732 - location
    l000-272 - location
    l000-334 - location
    l000-111 - location
    p309 - obj
    p674 - obj
    p122 - obj
    p776 - obj
    p614 - obj
    p978 - obj
    p112 - obj
    p33 - obj
    p680 - obj
    p975 - obj
    p41 - obj
    p146 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-299 c000 )
    ( in-city l000-397 c000 )
    ( in-city l000-172 c000 )
    ( in-city l000-148 c000 )
    ( in-city l000-732 c000 )
    ( in-city l000-272 c000 )
    ( in-city l000-334 c000 )
    ( in-city l000-111 c000 )
    ( obj-at p309 l000-732 )
    ( obj-at p674 l000-334 )
    ( obj-at p122 l000-148 )
    ( obj-at p776 l000-732 )
    ( obj-at p614 l000-732 )
    ( obj-at p978 l000-111 )
    ( obj-at p112 l000-397 )
    ( obj-at p33 l000-148 )
    ( obj-at p680 l000-334 )
    ( obj-at p975 l000-299 )
    ( obj-at p41 l000-397 )
    ( obj-at p146 l000-397 )
  )
  ( :tasks
    ( Deliver-12Pkg p309 p674 p122 p776 p614 p978 p112 p33 p680 p975 p41 p146 l000-000 )
  )
)
