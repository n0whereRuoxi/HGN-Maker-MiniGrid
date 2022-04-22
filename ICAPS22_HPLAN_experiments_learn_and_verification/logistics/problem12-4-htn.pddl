( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-941 - location
    l000-678 - location
    l000-841 - location
    l000-517 - location
    l000-751 - location
    l000-228 - location
    l000-290 - location
    l000-182 - location
    l000-688 - location
    l000-549 - location
    l000-943 - location
    l000-18 - location
    l000-736 - location
    l000-891 - location
    l000-396 - location
    l000-140 - location
    l000-978 - location
    p893 - obj
    p369 - obj
    p488 - obj
    p478 - obj
    p471 - obj
    p567 - obj
    p199 - obj
    p983 - obj
    p459 - obj
    p890 - obj
    p696 - obj
    p979 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-941 c000 )
    ( in-city l000-678 c000 )
    ( in-city l000-841 c000 )
    ( in-city l000-517 c000 )
    ( in-city l000-751 c000 )
    ( in-city l000-228 c000 )
    ( in-city l000-290 c000 )
    ( in-city l000-182 c000 )
    ( in-city l000-688 c000 )
    ( in-city l000-549 c000 )
    ( in-city l000-943 c000 )
    ( in-city l000-18 c000 )
    ( in-city l000-736 c000 )
    ( in-city l000-891 c000 )
    ( in-city l000-396 c000 )
    ( in-city l000-140 c000 )
    ( in-city l000-978 c000 )
    ( obj-at p893 l000-290 )
    ( obj-at p369 l000-140 )
    ( obj-at p488 l000-182 )
    ( obj-at p478 l000-978 )
    ( obj-at p471 l000-228 )
    ( obj-at p567 l000-140 )
    ( obj-at p199 l000-290 )
    ( obj-at p983 l000-18 )
    ( obj-at p459 l000-978 )
    ( obj-at p890 l000-688 )
    ( obj-at p696 l000-549 )
    ( obj-at p979 l000-891 )
  )
  ( :tasks
    ( Deliver-12Pkg p893 p369 p488 p478 p471 p567 p199 p983 p459 p890 p696 p979 l000-000 )
  )
)
