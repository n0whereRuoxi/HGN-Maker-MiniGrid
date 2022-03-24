( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b43 - block
    b204 - block
    b127 - block
    b615 - block
    b655 - block
    b854 - block
    b935 - block
    b110 - block
    b50 - block
    b64 - block
    b789 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b43 )
    ( on b204 b43 )
    ( on b127 b204 )
    ( on b615 b127 )
    ( on b655 b615 )
    ( on b854 b655 )
    ( on b935 b854 )
    ( on b110 b935 )
    ( on b50 b110 )
    ( on b64 b50 )
    ( on b789 b64 )
    ( clear b789 )
  )
  ( :tasks
    ( Make-10Pile b204 b127 b615 b655 b854 b935 b110 b50 b64 b789 )
  )
)
