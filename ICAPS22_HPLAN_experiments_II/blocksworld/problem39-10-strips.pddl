( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b44 - block
    b429 - block
    b494 - block
    b100 - block
    b684 - block
    b323 - block
    b981 - block
    b834 - block
    b445 - block
    b518 - block
    b697 - block
    b213 - block
    b710 - block
    b969 - block
    b349 - block
    b655 - block
    b472 - block
    b36 - block
    b775 - block
    b189 - block
    b951 - block
    b937 - block
    b832 - block
    b949 - block
    b22 - block
    b604 - block
    b965 - block
    b11 - block
    b404 - block
    b555 - block
    b709 - block
    b68 - block
    b776 - block
    b459 - block
    b224 - block
    b395 - block
    b178 - block
    b216 - block
    b594 - block
    b231 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b44 )
    ( on b429 b44 )
    ( on b494 b429 )
    ( on b100 b494 )
    ( on b684 b100 )
    ( on b323 b684 )
    ( on b981 b323 )
    ( on b834 b981 )
    ( on b445 b834 )
    ( on b518 b445 )
    ( on b697 b518 )
    ( on b213 b697 )
    ( on b710 b213 )
    ( on b969 b710 )
    ( on b349 b969 )
    ( on b655 b349 )
    ( on b472 b655 )
    ( on b36 b472 )
    ( on b775 b36 )
    ( on b189 b775 )
    ( on b951 b189 )
    ( on b937 b951 )
    ( on b832 b937 )
    ( on b949 b832 )
    ( on b22 b949 )
    ( on b604 b22 )
    ( on b965 b604 )
    ( on b11 b965 )
    ( on b404 b11 )
    ( on b555 b404 )
    ( on b709 b555 )
    ( on b68 b709 )
    ( on b776 b68 )
    ( on b459 b776 )
    ( on b224 b459 )
    ( on b395 b224 )
    ( on b178 b395 )
    ( on b216 b178 )
    ( on b594 b216 )
    ( on b231 b594 )
    ( clear b231 )
  )
  ( :goal
    ( and
      ( clear b44 )
    )
  )
)
