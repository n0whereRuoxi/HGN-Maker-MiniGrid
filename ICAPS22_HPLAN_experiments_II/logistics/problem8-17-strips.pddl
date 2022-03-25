( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-474 - location
    l000-149 - location
    l000-413 - location
    l000-231 - location
    l000-97 - location
    l000-12 - location
    l000-622 - location
    l000-360 - location
    l000-188 - location
    l000-666 - location
    l000-756 - location
    l000-679 - location
    l000-294 - location
    l000-384 - location
    l000-195 - location
    l000-515 - location
    p978 - obj
    p890 - obj
    p445 - obj
    p375 - obj
    p839 - obj
    p938 - obj
    p138 - obj
    p20 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-474 c000 )
    ( in-city l000-149 c000 )
    ( in-city l000-413 c000 )
    ( in-city l000-231 c000 )
    ( in-city l000-97 c000 )
    ( in-city l000-12 c000 )
    ( in-city l000-622 c000 )
    ( in-city l000-360 c000 )
    ( in-city l000-188 c000 )
    ( in-city l000-666 c000 )
    ( in-city l000-756 c000 )
    ( in-city l000-679 c000 )
    ( in-city l000-294 c000 )
    ( in-city l000-384 c000 )
    ( in-city l000-195 c000 )
    ( in-city l000-515 c000 )
    ( obj-at p978 l000-666 )
    ( obj-at p890 l000-97 )
    ( obj-at p445 l000-195 )
    ( obj-at p375 l000-12 )
    ( obj-at p839 l000-413 )
    ( obj-at p938 l000-97 )
    ( obj-at p138 l000-188 )
    ( obj-at p20 l000-149 )
  )
  ( :goal
    ( and
      ( obj-at p978 l000-000 )
      ( obj-at p890 l000-000 )
      ( obj-at p445 l000-000 )
      ( obj-at p375 l000-000 )
      ( obj-at p839 l000-000 )
      ( obj-at p938 l000-000 )
      ( obj-at p138 l000-000 )
      ( obj-at p20 l000-000 )
    )
  )
)
