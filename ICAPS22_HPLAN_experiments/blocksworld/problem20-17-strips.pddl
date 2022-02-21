( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b109 - block
    b64 - block
    b135 - block
    b895 - block
    b816 - block
    b494 - block
    b786 - block
    b773 - block
    b28 - block
    b958 - block
    b563 - block
    b457 - block
    b12 - block
    b430 - block
    b510 - block
    b536 - block
    b839 - block
    b654 - block
    b403 - block
    b46 - block
    b341 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b109 )
    ( on b64 b109 )
    ( on b135 b64 )
    ( on b895 b135 )
    ( on b816 b895 )
    ( on b494 b816 )
    ( on b786 b494 )
    ( on b773 b786 )
    ( on b28 b773 )
    ( on b958 b28 )
    ( on b563 b958 )
    ( on b457 b563 )
    ( on b12 b457 )
    ( on b430 b12 )
    ( on b510 b430 )
    ( on b536 b510 )
    ( on b839 b536 )
    ( on b654 b839 )
    ( on b403 b654 )
    ( on b46 b403 )
    ( on b341 b46 )
    ( clear b341 )
  )
  ( :goal
    ( and
      ( clear b109 )
    )
  )
)
