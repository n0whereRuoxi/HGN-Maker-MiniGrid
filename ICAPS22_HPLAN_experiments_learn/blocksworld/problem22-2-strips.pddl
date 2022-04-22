( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b190 - block
    b552 - block
    b481 - block
    b290 - block
    b73 - block
    b536 - block
    b604 - block
    b178 - block
    b508 - block
    b320 - block
    b485 - block
    b615 - block
    b776 - block
    b375 - block
    b377 - block
    b899 - block
    b867 - block
    b538 - block
    b781 - block
    b897 - block
    b556 - block
    b856 - block
    b140 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b190 )
    ( on b552 b190 )
    ( on b481 b552 )
    ( on b290 b481 )
    ( on b73 b290 )
    ( on b536 b73 )
    ( on b604 b536 )
    ( on b178 b604 )
    ( on b508 b178 )
    ( on b320 b508 )
    ( on b485 b320 )
    ( on b615 b485 )
    ( on b776 b615 )
    ( on b375 b776 )
    ( on b377 b375 )
    ( on b899 b377 )
    ( on b867 b899 )
    ( on b538 b867 )
    ( on b781 b538 )
    ( on b897 b781 )
    ( on b556 b897 )
    ( on b856 b556 )
    ( on b140 b856 )
    ( clear b140 )
  )
  ( :goal
    ( and
      ( clear b190 )
    )
  )
)
