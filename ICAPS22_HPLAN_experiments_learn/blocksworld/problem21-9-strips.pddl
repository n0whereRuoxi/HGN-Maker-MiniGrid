( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b465 - block
    b477 - block
    b144 - block
    b111 - block
    b454 - block
    b262 - block
    b496 - block
    b835 - block
    b19 - block
    b920 - block
    b993 - block
    b442 - block
    b776 - block
    b395 - block
    b91 - block
    b554 - block
    b284 - block
    b857 - block
    b458 - block
    b13 - block
    b206 - block
    b608 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b465 )
    ( on b477 b465 )
    ( on b144 b477 )
    ( on b111 b144 )
    ( on b454 b111 )
    ( on b262 b454 )
    ( on b496 b262 )
    ( on b835 b496 )
    ( on b19 b835 )
    ( on b920 b19 )
    ( on b993 b920 )
    ( on b442 b993 )
    ( on b776 b442 )
    ( on b395 b776 )
    ( on b91 b395 )
    ( on b554 b91 )
    ( on b284 b554 )
    ( on b857 b284 )
    ( on b458 b857 )
    ( on b13 b458 )
    ( on b206 b13 )
    ( on b608 b206 )
    ( clear b608 )
  )
  ( :goal
    ( and
      ( clear b465 )
    )
  )
)
