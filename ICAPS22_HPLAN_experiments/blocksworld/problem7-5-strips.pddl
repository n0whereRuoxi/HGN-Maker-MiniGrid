( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b558 - block
    b559 - block
    b776 - block
    b356 - block
    b430 - block
    b91 - block
    b872 - block
    b473 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b558 )
    ( on b559 b558 )
    ( on b776 b559 )
    ( on b356 b776 )
    ( on b430 b356 )
    ( on b91 b430 )
    ( on b872 b91 )
    ( on b473 b872 )
    ( clear b473 )
  )
  ( :goal
    ( and
      ( clear b558 )
    )
  )
)
